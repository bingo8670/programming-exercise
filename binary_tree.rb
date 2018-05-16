# 二叉树
class Node
  include Enumerable

  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end

  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end

  def <=>(other_node)
    data <=> other_node.data
  end
end

root = Node.new(3)
root.left = Node.new(2)
root.right = Node.new(1)
root.each {|x| puts x.data }

# just a few of the various operations Enumerable provides
puts "SUM"
puts root.inject(0) { |memo, val| memo += val.data }
puts "MAX"
puts root.max.data
puts "SORT"
puts root.sort.map(&:data)

