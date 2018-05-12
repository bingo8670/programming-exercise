# 题目: 输入体重和身高，输出身体质量指数(BMI)和建议
# BMI 公式为 bmi = ( 体重 / (身高x身高) )，单位是公斤和米
# 如果 BMI < 18.5，显示过轻
# 如果 BMI >= 24，显示过重
# 如果 BMI 介于 18.5 ~ 24，显示正常

print "请输入您的体重(公斤)，然后按 Enter: "
weight = gets.to_i

print "请输入您的身高(米)，然后按 Enter: "
height = gets.to_f

# .....
a = weight/(height*height)


if a<18.5
  b = "过轻"
elsif a >= 24
  b = "过重"
else
  b = "正常"
end
# puts "您的 BMI 是: #{a}"
puts format("您的 BMI 是: %.2f", a)    # 保留两位小数
# format 方法用于格式序列及其宽度，%s = 字符串，%i = 向下整数，%f = 浮点数
puts "您的 BMI 结果是: #{b}"  # (过轻或正常或过重)
