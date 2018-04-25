# 请输入 ruby weblog.rb development.log
require 'mysql2'
url = []
ip = []
time = []
date = []
clock = []
controller = []

filename = ARGV[0]
file = File.open(filename)
begin
  file.each_line do |line|
    url = line.scan(/\w+\/+\w.*\s/)
    ip = line.scan(/\d{3}.\d.\d.\d/)
    time = line.scan(/\d{4}-\d{2}-\d{2}.\d{2}.\d{2}.\d{2}/)
    # \d\d\d\d 可简写为 \d{4}
    controller = line.scan(/\s[A-Z].*Controller/)
    p url unless url.empty?
    p ip unless ip.empty?
    p time unless time.empty?
    p controller unless controller.empty?
  end
ensure
  file.close
end
#  url,ip,time,controller

=begin
client = Mysql2::Client.new(
    :host     => '127.0.0.1', # 主机
    :username => 'root',      # 用户名
    :password => '123456',    # 密码
    :database => 'test',      # 数据库
    :encoding => 'utf8'       # 编码
    )
results = client.query("SELECT VERSION()")
results.each do |row|
  puts row
end
=end
