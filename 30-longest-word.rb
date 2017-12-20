print " 请输入英文句子，输完之后按 Enter:"
s = gets.to_str

=begin 第一种方法
def longest_word(s)
  s.split(" ").sort! {|a_word, b_word| b_word.length <=>           a_word.length}[0]
end
=end

#第二种方法
def find_long(s)
    # your code here
    l = s.split.max_by(&:length)
    return l # l: length of the shortest word
end

puts "最长的单词是 #{find_long(s)}"
