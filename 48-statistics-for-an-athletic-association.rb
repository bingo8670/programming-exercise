# 计算跑步时间的最高最低差，平均值，中位数
require "time"

class Array
  def range
    minmax.reverse.inject(:-)
  end

  def average
    inject(:+) / length
  end

  def median
    middle = length / 2
    sorted = sort
    length.odd? ? sorted[middle] : 0.5 * (sorted[middle] + sorted[middle - 1])
  end
end

def stat(strg)
  return "" if strg.empty?

  times = strg.split(", ").map { |time| parse_time(time) }.sort

  stats = {
    "Range"   => times.range,
    "Average" => times.average,
    "Median"  => times.median
  }
  stats.map { |stat, time| "#{stat}: #{format_time(time)}" }.join(" ")
end

def parse_time(str)
  str.split("|").inject(0) { |time, n| time * 60 + n.to_i }
end

def format_time(seconds)
  Time.at(seconds).utc.strftime("%H|%M|%S")
end

p stat("01|15|59, 1|47|16, 01|17|20, 1|32|34, 2|17|17")
# => "Range: 01|01|18 Average: 01|38|05 Median: 01|32|34"
p stat("02|15|59, 2|47|16, 02|17|20, 2|32|34, 2|17|17, 2|22|00, 2|31|41")
# => "Range: 00|31|17 Average: 02|26|18 Median: 02|22|00")
