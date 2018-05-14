# 请输入 ruby nginx_access_scan2.rb

require 'mysql2'
require 'digest/md5'
require 'rails'

md5 = []
dataes  = []
count   = 0

def open_file(path)
  File.open(path)
end

def time_format(time)
  time = time[0].sub(/:/, ' ')
  time.to_time.strftime("%Y-%m-%d %H:%M:%S")
end

def generate_md5(url)
  url_md5 = Digest::MD5.hexdigest(url)
end

def url_unique(url, url_md5)
  @md5 ||= []
  # 如果是nil，那么让它成为一个空数组；如果它不是nil，那么什么也不做。
  if @md5.include?(url_md5)
    url = []
  else
    @md5       = @md5.push(url_md5)
    return url
  end
end

def insert_query(dataes)
  client = Mysql2::Client.new(
      :host     => '127.0.0.1', # 主机
      :username => 'root',      # 用户名
      :password => '123123',    # 密码
      :database => 'weblog',    # 数据库
      :encoding => 'utf8'       # 编码
      )

  dataes.each do |datas|
    datas.each do |i|
      client.query("INSERT INTO nginx(ip, time, actor, url, state, length, refer, agent) VALUES ('#{i[0]}', '#{i[1]}', '#{i[2]}', '#{i[3]}', '#{i[4]}', '#{i[5]}', '#{i[6]}', '#{i[7]}')")
    end
  end
end

file = open_file("./nginx.access.log")

file.each_line do |line|
  count      += 1
  words       = line.split
  ip          = line.scan(/^\d{2}\.\d{2}\.\d{2}\.\d{2}/)
  time        = line.scan(/\d+\/\w+\/\d{4}\:\d{2}\:\d{2}\:\d{2}/)
  time        = [ time_format(time) ]
  actor       = [line.scan(/[A-Z]{3}/)[0]]
  url         = [line.scan(/\w*\/\w*\/*\w*\/*\w*/)[1]]
  url_md5     = [ generate_md5(url[0]) ]
  url = [ url_unique(url, url_md5) ]

  state       = [line.scan(/\d{3}/)[2]]
  length      = [words[9]]
  refer       = [words[10]]
  agent       = [words[-7..-2].join(" ")]

  if url == [[]]
    datas = []
  else
    datas     = [ ip + time + actor + url + state + length + refer + agent ]
  end

  dataes      = dataes.push(datas) unless datas == []     # 删除空条目
  p datas unless datas == []      # 只显示非空项
end

p "共有#{count} 条日志记录，提取信息如上所示👆"    # 如上所示👆、如下所示👇

insert_query(dataes)

file.close
