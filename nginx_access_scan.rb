# 请输入 ruby nginx_access_scan.rb nginx.access.log

require 'mysql2'
require 'digest/md5'
require 'rails'

client = Mysql2::Client.new(
    :host     => '127.0.0.1', # 主机
    :username => 'root',      # 用户名
    :password => '123123',    # 密码
    :database => 'weblog',    # 数据库
    :encoding => 'utf8'       # 编码
    )


lines   = []
ip      = []
time    = []
actor   = []
url     = []
url_md5 = []
md5     = []
state   = []
length  = []
refer   = []
agent   = []
datas   = []
dataes  = []
count   = 0

filename = ARGV[0]
file = File.open(filename)   # 文件目录

# log以空行分段
file.each_line do |line|
  count      += 1
  words       = line.split
  ip          = line.scan(/^\d{2}\.\d{2}\.\d{2}\.\d{2}/)

# 处理time格式问题，先取消 2018:15 中间的“：”，然后使用 rails的to_time、strftime 方法
  time        = line.scan(/\d+\/\w+\/\d{4}\:\d{2}\:\d{2}\:\d{2}/)
  time        = time[0].sub(/:/, ' ')
  time        = [ time.to_time.strftime("%Y-%m-%d %H:%M:%S") ]

  actor       = [line.scan(/[A-Z]{3}/)[0]]

# 要求URL唯一，如果重复只保留第一条；将 URL 转换为 md5 加密值，经过比对，如果重复，URL = []
# Digest::MD5.hexdigest('abc')      #=> "90015098..."
  url         = [line.scan(/\w*\/\w*\/*\w*\/*\w*/)[1]]
  url_md5     = [ Digest::MD5.hexdigest(url[0]) ]
  if md5.include?(url_md5)
    url = []
  else
    md5       = md5.push(url_md5)
    url       = [line.scan(/\w*\/\w*\/*\w*\/*\w*/)[1]]
  end

  state       = [line.scan(/\d{3}/)[2]]
  length      = [words[9]]
  refer       = [words[10]]
  agent       = [words[-7..-2].join(" ")]

  if url == []
    datas = []
  else
    datas     = [ ip + time + actor + url + state + length + refer + agent ]
  end

  dataes      = dataes.push(datas) unless datas == []     # 删除空条目
  # p datas       # 显示每一行提取的字段
end

p "共有#{count} 条日志记录，提取信息如下所示👇"    # 如上所示👆、如下所示👇
p dataes          # 显示提取字段的合集
# 显示每行提取字段的合集，然后再合集，比较美观；


dataes.each do |datas|
  datas.each do |i|
    client.query("INSERT INTO nginx(ip, time, actor, url, state, length, refer, agent) VALUES ('#{i[0]}', '#{i[1]}', '#{i[2]}', '#{i[3]}', '#{i[4]}', '#{i[5]}', '#{i[6]}', '#{i[7]}')")
  end
end

# p "#{dataes[0][0][0]}"

# 已验证单行数据可插入成功
  #client.query(" INSERT INTO nginx(ip, time, actor, url, state, length, refer, agent) VALUES ('#{dataes[0][0][0]}', '#{dataes[0][0][1]}', '#{dataes[0][0][2]}', '#{dataes[0][0][3]}', '#{dataes[0][0][4]}', '#{dataes[0][0][5]}', '#{dataes[0][0][6]}', '#{dataes[0][0][7]}' ) ")
