# 题目: 输入一个数字 x，请判断是否正数、零或负数，以及是不是偶数


print "请输入一个整数，然后按 Enter: "
x = gets.to_i
if x > 0
  a = "正数"
elsif x < 0
  a = "负数"
else
  a = "零"
end

b = x%2
if b == 0
  c = "偶数"
else
  c = "奇数"
end
# ....

puts "这个数是__#{a}___ (正数或零或负数)"
puts "这个数是__#{c}___ (偶数或奇数)"
