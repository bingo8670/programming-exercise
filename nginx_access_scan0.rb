# 请输入 ruby nginx_access_scan0.rb nginx.access.log

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
dataes = []
count  = 0

filename = ARGV[0]
file = File.open(filename)   # 文件目录

# log以空行分段
file.each_line do |line|
  count      += 1
  words       = line.split
  ip          = words[0]
  time        = words[3]
  action      = words[5]
  url         = words[6]
  state       = words[8]
  length      = words[9]
  refer       = words[10]
  agent       = words[-7..-2].join(" ")
  datas       = [ ip, time, action, url, state, length, refer, agent ]
  dataes      = dataes.push(datas) if datas != [[]]    # 删除空条目
  p datas
end

p "共有#{count} 条日志记录，提取信息如上所示👆"    # 如上所示👆、如下所示👇
#p dataes
# 显示每行提取字段的合集，然后再合集，比较美观；
