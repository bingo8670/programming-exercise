# 方向计算，去除相邻的相反方向

OPPOSITE = {
  "NORTH" => "SOUTH",
  "SOUTH" => "NORTH",
  "EAST"  => "WEST",
  "WEST"  => "EAST"
}

def dirReduc(arr)
  stack = []
  arr.each do |dir|
    OPPOSITE[dir] == stack.last ? stack.pop : stack.push(dir)
  end
  stack
end

a = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
p dirReduc(a)   # => ["WEST"])
u=["NORTH", "WEST", "SOUTH", "EAST"]
p dirReduc(u)   # => ["NORTH", "WEST", "SOUTH", "EAST"])
