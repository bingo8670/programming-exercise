# 数字各个位数相加
# My Solution
def sumDigits(number)
  num = 0
  number.to_s.split("").each {|x| num += x.to_i.abs}
  num
end

# Better Solution
def sumDigits(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

# Another Solution
def sumDigits(number)
  number.abs.to_s.split("").map(&:to_i).inject(&:+)
end

p sumDigits(10)    # Returns 1
p sumDigits(99)    # Returns 18
p sumDigits(-32)   # Returns 5
