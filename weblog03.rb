# 请输入 ruby weblog02.rb development.log
require 'mysql2'
lines = []
url = []
ip = []
time = []
controller = []
datas = []
dataes = []
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
  datas       = [url + ip + time + controller]
  dataes      = dataes.push(datas)

  p "正在解析第#{count} 条日志记录，提取信息如下所示👇"
  p datas
  p "------------------------"
}
  client = Mysql2::Client.new(
      :host     => '127.0.0.1', # 主机
      :username => 'root',      # 用户名
      :password => '123123',    # 密码
      :database => 'weblog',    # 数据库
      :encoding => 'utf8'       # 编码
      )
  dataes.each do |datas|
    datas.each do |i|
      client.query("INSERT INTO Weblog(Url, Ip, Time, Controller) VALUES ('#{i[0]}', '#{i[1]}', '#{i[2]}', '#{i[3]}')")
    end
  end


# 已验证单行数据可插入成功
  #client.query("INSERT INTO Weblog(Url, Ip, Time, Controller) VALUES ('#{dataes[0][0][0]}', '#{dataes[0][0][1]}', '#{dataes[0][0][2]}', '#{dataes[0][0][3]} ')")
