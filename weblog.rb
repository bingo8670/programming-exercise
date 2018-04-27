# 请输入 ruby weblog.rb development.log
require 'mysql2'
url = []
ip = []
time = []
date = []
clock = []
controller = []
count = 0

filename = ARGV[0]
file = File.open(filename)

# log以空行分段
file.chunk { |line|
  /\A\s*\z/ !~ line || nil        # log以空行分段
}.each { |_, lines|               # lines 为一个记录段
  count += 1                      # 第几条日志
  lines.each do |line|
    words = line.split
    words.each do |word|

      if word =~/\w?\/\w?/ && (count > url.size)    # 只提取第一条URL
        url = url.push(word)
      end

      ip = ip.push(word) if word =~/\d{3}\.\d\.\d\.\d/ && (count > ip.size)    # 只提取第一条URL
      #time = time.push(word) if word =~/\d{4}-\d{2}-\d{2}|\d{2}.\d{2}.\d{2}/
      date = date.push(word) if word =~/\d{4}-\d{2}-\d{2}/ && (count > date.size)    # 只提取第一条URL
      clock = clock.push(word) if word =~/^\d{2}\:\d{2}\:\d{2}$/ && (count > clock.size)    # 只提取第一条URL     ^,$ 分别代表起始位置，可用于精准匹配
      # \d\d\d\d 可简写为 \d{4}， | 表示 或
      controller = controller.push(word) if word =~/[A-Z].*Controller/ && (count > controller.size)    # 只提取第一条URL
    end
  end
}

p "共有#{count} 条日志记录，提取信息如下所示：> "
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
