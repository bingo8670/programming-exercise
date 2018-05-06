# 反转字符串并只保留字母；
def reverse_letter(string)
  string.gsub(/[^a-zA-Z]/, '').reverse
end

p reverse_letter("krishan")             # =>"nahsirk"
p reverse_letter("ultr53o?n")           # =>"nortlu"
p reverse_letter("ab23c")               # =>"cba"

def reverse_letter(string)
  string.scan(/[a-zA-Z]/).join.reverse
end
