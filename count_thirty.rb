# 数30的关键数字
# 从1开始数，一次最多喊3个数字，即1，1/2，1/2/3
# 三种，后面的人继续这样数，谁喊30这个数字就称为输家，被惩罚。

i = 1
while (30 - 4 * i) > 0
  n = 30 - 4 * i
  i += 1
  puts n
end

# 游戏变种的算法
# 数m，一次最多喊x个数字，最后数到m的人输；
# n = m - (x + 1) * i
def count(m, x)
  i = 1
  n = m - (x + 1) * i
  while n > 0
  n = m - (x + 1) * i
   i += 1
   puts n
  end
end

count(50, 3)
count(30, 3)

