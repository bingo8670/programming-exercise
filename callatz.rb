# 考拉咨猜想
def collatz(number)
  puts(number)    #print不自动换行，puts会自动换行
  if number ==1
    number
  elsif number % 2 == 0
    collatz(number/ 2)
  else
    collatz(3*number + 1)
  end
end

print("请输入一个正整数")
n = gets.to_i
unless collatz(n) != 1
  collatz(n)
end
