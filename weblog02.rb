require 'mysql2'
url = []
ip = []
time = []
date = []
clock = []
controller = []
count = 0
file = File.open("development.log")

begin
  file.each_line do |line|
    #url = line.scan(/\w+\/+\w.*\s/)
    if line.scan(/Started/)
      count += 1
    end
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
ensure
  file.close
end


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
  #client.query("INSERT INTO Weblog(Url, Ip, Date, Clock, Controller) VALUES ('welcome/index.html.erb', '127.0.0.1', '2018-04-17', '12:02:59', 'WelcomeController#index')")
