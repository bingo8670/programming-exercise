# 题目: 列出 1 到 100 之间，所有 7 的倍数
puts "1 到 100 之间，7的倍数的数字有："
 i = 1
 while ( i <= 100 )

  # ....
  if i%7 == 0
    puts i
  end
  i+=1
end


puts "1 到 100 之间，所有 7 的倍数和包含7的数字有："
i = 1

while ( i <= 100 )
  if i%7 ==0
   puts i
 elsif i/10 == 7
   puts i
 elsif i%10 == 7
   puts i
  end
  i += 1
end
