=begin
验证一个数字是否是斐波那契数相邻两个数的乘积

斐波那契数是在以下的整数序列（FN）的数字：
0，1，1，2，3，5，8，13，21，34，55，89，144，233，...


# Your function productFib takes an integer (prod) and returns an array:

# [F(n), F(n+1), true] or {F(n), F(n+1), 1} or (F(n), F(n+1), True)
# depending on the language if F(n) * F(n+1) = prod.

# If you don't find two consecutive F(m) verifying F(m) * F(m+1) = prodyou will return

# [F(m), F(m+1), false] or {F(n), F(n+1), 0} or (F(n), F(n+1), False)
# F(m) being the smallest one such as F(m) * F(m+1) > prod.

# Examples

# productFib(714) # should return [21, 34, true],
#                 # since F(8) = 21, F(9) = 34 and 714 = 21 * 34

# productFib(800) # should return [34, 55, false],
#                 # since F(8) = 21, F(9) = 34, F(10) = 55 and 21 * 34 < 800 < 34 * 55
# Test.assert_equals(productFib(4895), [55, 89, true])
# Test.assert_equals(productFib(5895), [89, 144, false])

# first keep calcing fibs prods using n+1 till reach sum >= prod
# then return this number in said format
# initially store and overwrite fm, fm+1 every round
# delete first entry of array fib after every calc

# def productFib(prod)
#   fib = [0, 1]
#   fib[fib.index(fib.min)] = fib.reduce(:+) until fib.reduce(:*) >= prod
#   fib.reduce(:*) == prod ? [fib.min, fib.max, true] : [fib.min, fib.max, false]
# end

# def productFib(prod)
#   fib = [0, 1]
#   fib[fib.index(fib.min)] = fib.reduce(:+) until fib.reduce(:*) >= prod
#   [fib.min, fib.max, fib.reduce(:*) == prod]
# end
=end

def productFib(prod)
  a, b = [0, 1]
    a, b = b, a + b while b * a < prod
  [a, b, b * a == prod]
end

p productFib(40)
