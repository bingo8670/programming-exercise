# 除法结果变为 整数+分数的形式；
def mixed_fraction(string)
  improper = Rational(*(string.split('/').map(&:to_i)))
  integer  = improper.to_i
  fraction = improper - integer

  return "#{integer}"  if (fraction).numerator == 0
  return "#{fraction}" if integer == 0
  "#{integer} #{fraction.abs}"
end

p mixed_fraction('42/9')         # => '4 2/3'
p mixed_fraction('-22/-7')       # => '3 1/7'
p mixed_fraction("0/0")          # => divided by 0 (ZeroDivisionError)
