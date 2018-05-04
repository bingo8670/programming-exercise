require 'digest/md5'
require "rails"

# 这里的 to_time 方法是 rails 里的！
p "02/May/2018 15:44:03".to_time.strftime("%Y-%m-%d %H:%M:%S")

p Digest::MD5.hexdigest('abc')      #=> "90015098..."
