# 数组平均值

# My Solution
def average(array)
  (array.inject(:+).to_f / array.length).round
end
# round 方法可得到四舍五入值，即最近的整数；

# Another Solution
def average(array)
  array.inject(:+).fdiv(array.length).round
end

p average([5, 78, 52, 900, 1])         # => 207
p average([5, 25, 50, 75])             # => 39
p average([2])                         # => 2

