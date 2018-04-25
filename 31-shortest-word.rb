print " 请输入英文句子，输完之后按 Enter:"
s = gets.to_str

def find_short(s)
    # your code here
    l = s.split.min_by(&:length).size
    return l # l: length of the shortest word
end

puts "最短的单词字母数是 #{find_short(s)}"
