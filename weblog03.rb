require 'mysql2'
lines = []
url = []
ip = []
time = []
date = []
clock = []
controller = []
file = File.open("development.log")

# log以空行分段
file.chunk { |line|
  /\A\s*\z/ !~ line || nil        # log以空行分段
}.each { |_, lines|
  lines.each do |line|
    words = line.split
    words.each do |word|
      url = url.push(word) if word =~/\w+\/\w+/
      ip = ip.push(word) if word =~/\d{3}.\d.\d.\d/
      #time = time.push(word) if word =~/\d{4}-\d{2}-\d{2}|\d{2}.\d{2}.\d{2}/
      date = date.push(word) if word =~/\d{4}-\d{2}-\d{2}/
      clock = clock.push(word) if word =~/\d{2}:\d{2}:\d{2}/
      # \d\d\d\d 可简写为 \d{4}， | 表示 或
      controller = controller.push(word) if word =~/[A-Z].*Controller/
    end
  end

  p "> "
  p url
  p ip
  p date
  p clock
  p controller

  client = Mysql2::Client.new(
      :host     => '127.0.0.1', # 主机
      :username => 'root',      # 用户名
      :password => '123123',    # 密码
      :database => 'weblog',    # 数据库
      :encoding => 'utf8'       # 编码
      )
  url.zip(ip, date, clock, controller) do |a, b, c, d, e|
    # zip 方法会将接收器和参数传来的数组元素逐一取出，而且每次都会启动块。
    client.query("INSERT INTO Weblog(Url, Ip, Date, Clock, Controller) VALUES ('#{a}', '#{b}', '#{c}', '#{d}', '#{e}')")
  end
}

=begin
    #(url, ip, date, clock, controller).each do |i|
    #  client.query("INSERT INTO Weblog(Url, Ip, Date, Clock, Controller) VALUES ('#{i}')")
    #end
=end
