=begin
找出输入英文内包含的元音总数
Return the number (count) of vowels in the given string.
We will consider a, e, i, o, and u as vowels for this Kata.
=end
print " 请输入英文句子，输完之后按 Enter:"
inputStr = gets.to_str

# My Solution
def getCount(inputStr)
  inputStr.chars.count {|c| c =~ /[aeiou]/i }
end

# Better Solution
def getCount(inputStr)
  inputStr.count("aeiou")
end

puts "输入内容包含的元音总数是 #{getCount(inputStr)}"
