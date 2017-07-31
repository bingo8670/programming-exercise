# 给定一个数组包含 Hash，请过滤和排序

arr = [
  { "name" => "Peter", "age" => 30 },
  { "name" => "John", "age" => 15 },
  { "name" => "David", "age" => 45 },
  { "name" => "Steven", "age" => 22 },
  { "name" => "Vincent", "age" => 6 },
]

def filter(arr)
  array = []
  arr.each do |arr|
    if arr["age"] >=18
      array << arr
    end
  end
  array.sort! { |x,y| x["age"] <=> y["age"]}
  return array
end

array = filter(arr)

puts "所有成年人，并由小到大: __#{array}_______"

# 答案应该是
#[
#  { "name" => "Steven", "age" => 22 },
#  { "name" => "Peter", "age" => 30 },
#  { "name" => "David", "age" => 45 }
#]
