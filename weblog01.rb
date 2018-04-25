require 'mysql2'
url = []
ip = []
time = []
date = []
clock = []
controller = []
file = File.open("development.log")
begin
  file.each_line do |line|
    #url = line.scan(/\w+\/+\w.*\s/)
    words = line.split
    words.each do |word|
      url = url.push(word) if word =~/\w+\/\w+/
      ip = ip.push(word) if word =~/\d{3}.\d.\d.\d/
      #time = time.push(word) if word =~/\d{4}-\d{2}-\d{2}|\d{2}.\d{2}.\d{2}/
      date = date.push(word) if word =~/\d{4}-\d{2}-\d{2}/
      clock = clock.push(word) if word =~/\d{2}:\d{2}:\d{2}/
      # \d\d\d\d 可简写为 \d{4}， | 表示 或
      if word =~/[A-Z].*Controller/
        word = word.scan(/[A-Z].*Controller/)
        controller = controller.push(word)
      end
    end
  end
  p "> url 有："
  p url
  p "> ip 有："
  p ip
  p "> time 有："
  p date
  p clock
  p "> controller 有："
  p controller
ensure
  file.close
end

=begin
client = Mysql2::Client.new(
    :host     => '127.0.0.1', # 主机
    :username => 'root',      # 用户名
    :password => '123456',    # 密码
    :database => 'log',      # 数据库
    :encoding => 'utf8'       # 编码
    )
results = client.query("insert into table log(url)")
results.each do |row|
  puts row
end
=end
