# 输入一个数字 N，请检查是不是质数

def is_prime(n)
  i = 2
  while ( i <= n-1 ) # 可以得出正确结论，但是效能不行
    return false if n <= 1 || n % i == 0
    i += 1
  end

  true
end

print "请输入数字 N，然后按 Enter: "
n = gets

if is_prime(n.to_i)
  puts "这是质数"
else
  puts "这不是质数"
end
