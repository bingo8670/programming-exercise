def time_translate(string)
  nstring = string.dup           ## 返回自己的副本
  nstring.gsub!(/Jan/, "1")
  nstring.gsub!(/Feb/, "2")
  nstring.gsub!(/Mar/, "3")
  nstring.gsub!(/Apr/, "4")
  nstring.gsub!(/May/, "5")
  nstring.gsub!(/Jun/, "6")
  nstring.gsub!(/Jul/, "7")
  nstring.gsub!(/Aug/, "8")
  nstring.gsub!(/Sep/, "9")
  nstring.gsub!(/Oct/, "10")
  nstring.gsub!(/Nov/, "11")
  nstring.gsub!(/Dec/, "12")

end

p time_translate("May")
