print " 请输入英文句子，输完之后按 Enter:"
words = gets.to_str

def longest_word(words)
  words.split(" ").sort! {|a_word, b_word| b_word.length <=>           a_word.length}[0]
end


puts "最长的单词是 #{longest_word(words)}"
