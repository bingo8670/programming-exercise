# 创建一个接受Rows x Columns维度作为参数的函数，以创建根据给定维度调整大小的乘法表。 **函数的返回值必须是数组，数字必须是Fixnums，NOT字符串。

def multiplication_table(r, c)    # r=row, c = cloumns
  (1..r).map { |i|
    (1..c).map { |j| i * j }
  }
end

p multiplication_table(3,3)
# => [[1, 2, 3], [2, 4, 6], [3, 6, 9]]
p multiplication_table(3,4)
# => [[1, 2, 3, 4], [2, 4, 6, 8], [3, 6, 9, 12]]
