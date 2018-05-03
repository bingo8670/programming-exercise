# 请输入 ruby nginx_access_scan1.rb nginx.access.log

require 'mysql2'
require 'digest/md5'

client = Mysql2::Client.new(
    :host     => '127.0.0.1', # 主机
    :username => 'root',      # 用户名
    :password => '123123',    # 密码
    :database => 'weblog',    # 数据库
    :encoding => 'utf8'       # 编码
    )


lines  = []
ip     = []
time   = []
actor = []
url    = []
state  = []
length = []
refer  = []
agent  = []
datas  = []
dataes = []
count  = 0

filename = ARGV[0]
file = File.open(filename)   # 文件目录

# log以空行分段
file.each_line do |line|
  count      += 1
  words       = line.split
  ip          = line.scan(/^\d{2}\.\d{2}\.\d{2}\.\d{2}/)
  time        = line.scan(/\d+\/\w+\/\d{4}\:\d{2}\:\d{2}\:\d{2}/)
  actor       = [line.scan(/[A-Z]{3}/)[0]]
  url         = [line.scan(/\w*\/\w*\/*\w*\/*\w*/)[1]]
  state       = [line.scan(/\d{3}/)[2]]
  length      = [words[9]]
  refer       = [words[10]]
  agent       = [words[-7..-2].join(" ")]
  datas       = [ ip + time + actor + url + state + length + refer + agent ]   # 数据类型不一样，无法导入mysql
  dataes      = dataes.push(datas) if datas != [[]]    # 删除空条目
  # p ip
end

p "共有#{count} 条日志记录，提取信息如上所示👆"    # 如上所示👆、如下所示👇
p dataes
# 显示每行提取字段的合集，然后再合集，比较美观；


dataes.each do |datas|
  datas.each do |i|
    client.query("INSERT INTO nginx(ip, time, actor, url, state, length, refer, agent) VALUES ('#{i[0]}', '#{i[1]}', '#{i[2]}', '#{i[3]}', '#{i[4]}', '#{i[5]}', '#{i[6]}', '#{i[7]}')")
  end
end

# p "#{dataes[0][0][0]}"

# 已验证单行数据可插入成功
  #client.query(" INSERT INTO nginx(ip, time, actor, url, state, length, refer, agent) VALUES ('#{dataes[0][0][0]}', '#{dataes[0][0][1]}', '#{dataes[0][0][2]}', '#{dataes[0][0][3]}', '#{dataes[0][0][4]}', '#{dataes[0][0][5]}', '#{dataes[0][0][6]}', '#{dataes[0][0][7]}' ) ")
