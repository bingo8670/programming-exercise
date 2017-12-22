=begin
 Write function removeExclamationMarks which removes all exclamation
 marks from a given string.
remove("Hi!") === "Hi"
remove("Hi!!!") === "Hi!!"
remove("!Hi") === "!Hi"
remove("!Hi!") === "!Hi"
remove("Hi! Hi!") === "Hi! Hi"
remove("Hi") === "Hi"
=end

# My Solution
def remove_exclamation_marks(s)
  s.delete('!')  # 会删掉全部 ！，而不是末尾的
end

# Better Solution
def remove(s)
  s.chomp('!')
end

=begin
chomp会删掉结尾的符号
"hello".chomp            #=> "hello"
"hello\n".chomp          #=> "hello"
"hello\r\n".chomp        #=> "hello"
"hello\n\r".chomp        #=> "hello\n"
"hello\r".chomp          #=> "hello"
"hello \n there".chomp   #=> "hello \n there"
"hello".chomp("llo")     #=> "he"
=end

def remove(s)
  s.sub(/!$/, "")
end

=begin
"hello".sub(/[aeiou]/, '*')                  #=> "h*llo"
"hello".sub(/([aeiou])/, '<\1>')             #=> "h<e>llo"
"hello".sub(/./) {|s| s.ord.to_s + ' ' }     #=> "104 ello"
"hello".sub(/(?<foo>[aeiou])/, '*\k<foo>*')  #=> "h*e*llo"
=end

def remove(s)
  s.gsub(/!$/,'')
end

=begin
"hello".gsub(/[aeiou]/, '*')                  #=> "h*ll*"
"hello".gsub(/([aeiou])/, '<\1>')             #=> "h<e>ll<o>"
"hello".gsub(/./) {|s| s.ord.to_s + ' '}      #=> "104 101 108 108 111 "
"hello".gsub(/(?<foo>[aeiou])/, '{\k<foo>}')  #=> "h{e}ll{o}"
'hello'.gsub(/[eo]/, 'e' => 3, 'o' => '*')    #=> "h3ll*"
=end

def remove(s)
  s[-1] == "!" ? s[0..-2] : s
end
