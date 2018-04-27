# 请输入 ruby weblog02.rb development.log
require 'mysql2'
lines = []
url = []
ip = []
time = []
controller = []
data = []
count = 0

filename = ARGV[0]
file = File.open(filename)   # 文件目录


# log以空行分段
file.chunk { |line|
  /\A\s*\z/ !~ line || nil        # log以空行分段
}.each { |_, lines|               # lines 为一个记录段
  count += 1                      # 第几条日志
  url         = lines[0].scan(/\w*\/\w*\/*\w*\/*\w*/)
  # 匹配有1/2/3个“/” 的URL
  ip          = lines[0].scan(/\d{3}\.\d\.\d\.\d/)
  time        = lines[0].scan(/\d{4}-\d{2}-\d{2}.\d{2}.\d{2}.\d{2}/)
  # \d\d\d\d 可简写为 \d{4}， | 表示 或
  controller  = lines[1].scan(/[A-Z]\w*Controller\#\w*/) if lines[1] != nil
  data        = [url, ip, time, controller]
  p data
}

p "共有#{count} 条日志记录，提取信息如上所示 👆 "

client = Mysql2::Client.new(
    :host     => '127.0.0.1', # 主机
    :username => 'root',      # 用户名
    :password => '123123',    # 密码
    :database => 'weblog',    # 数据库
    :encoding => 'utf8'       # 编码
    )
#data.each do |i|
#    client.query("INSERT INTO Weblog(Url, Ip, Time, Controller) VALUES ('#{i}')")
#end


#url.zip(ip, date, clock, controller) do |a, b, c, d, e|
  # zip 方法会将接收器和参数传来的数组元素逐一取出，而且每次都会启动块。
  #client.query("INSERT INTO Weblog(Url, Ip, Date, Clock, Controller) VALUES ('#{a}', '#{b}', '#{c}', '#{d}', '#{e}')")
#end
