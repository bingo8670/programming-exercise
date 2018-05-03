# 请输入 ruby nginx_access_scan.rb nginx.access.log

require 'mysql2'
require 'digest/md5'

lines  = []
ip     = []
time   = []
action = []
url    = []
state  = []
length = []
refer  = []
agent  = []
datas  = []
count  = 0

filename = ARGV[0]
file = File.open(filename)   # 文件目录

# log以空行分段
file.each_line do |line|
  count      += 1
  words       = line.split
  ip          = ip.push(words[0])
  time        = time.push(words[3])
  action      = action.push(words[5])
  url         = url.push(words[6])
  state       = state.push(words[8])
  length      = length.push(words[9])
  refer       = refer.push(words[10])
  agent       = agent.push((words[-7..-2]).join(" "))
  datas       = [ ip, time, action, url, state, length, refer, agent ]
end

p "共有#{count} 条日志记录，提取信息如下所示👇"
p datas
# 显示每个字段的合集，然后再合集，比较杂乱；
