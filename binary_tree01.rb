# 二叉树
class Tree
  public
  def initialize(data,left=nil,right=nil)
    @data = data
    @left = left
    @right = right
  end
  def selfdata
    @data
  end
  def leftchild
    @left
  end
  def rightchild
    @right
  end
  #描述根节点
  def strTree
    "My data is:#@data\nMy leftchild is:#{@left.selfdata}\nMy rightchild is:#{@right.selfdata}"
  end
  #后序遍历
  def PostOrder
    @left.PostOrder if @left!=nil
    @right.PostOrder if @right!=nil
    print "#@data " if @data!=nil
  end
  #树的深度
  def TreeDepth
     return 1 if (@left==nil and @right==nil)
     if @left.TreeDepth >= @right.TreeDepth
      return (@left.TreeDepth+1)
     else
      return (@right.TreeDepth+1)
    end
  end
  #树的叶子节点数
  def LeafNodeNum
    return 1 if(@left==nil and @right==nil)
    leftleaf = (@left.LeafNodeNum)
    rightleaf= (@right.LeafNodeNum)
    return leftleaf+rightleaf
  end
  #第k层节点个数
  def getKthlevelnode(k)
    return 0 if(k<1 or (k>1 and @left==nil and @right==nil))
    #return 0 if(k<1 or self==nil)
    return -1 if(k>self.TreeDepth)
    return 1 if(k==1)
    ln = @left.getKthlevelnode(k-1)
    rn = @right.getKthlevelnode(k-1)
    return ln+rn
  end
  #二叉树镜像
  def MirrorTree
    return self if(@left==nil and @right==nil)
    leftMirror = @left.MirrorTree
    rightMirror= @right.MirrorTree
    @left = rightMirror
    @right = leftMirror
    return self
  end
  #层序遍历
  def LevelTraverse
    q = Array.new
    q.push(self)
    while(q.empty? ==false)
      tmp = q.first
      print "#{tmp.selfdata} "
      q.delete_at(0)
      if(tmp.leftchild!=nil)
        q.push(tmp.leftchild)
      end
      if(tmp.rightchild!=nil)
        q.push(tmp.rightchild)
      end
    end
  end
  private
    @data
    @left
    @right
end
T1 = Tree.new(1)
T2 = Tree.new(2)
tr = Tree.new(3,T1,T2)
T4 = Tree.new(4,tr,T1)
puts tr.strTree
puts T4.strTree
print "后根序："
puts T4.PostOrder
print "树的层数："
puts T4.TreeDepth
print "树的叶子节点数："
puts T4.LeafNodeNum
print "第3层节点个数："
puts T4.getKthlevelnode(3)
for i in 1..T4.TreeDepth
  print T4.selfdata * i
  print " #{'a'*3} ",T4.leftchild.selfdata,' ',T4.rightchild.selfdata
  print "\n"
end
puts "T4的镜像："
puts T4.MirrorTree.PostOrder
puts "层序遍历；"
puts T4.LevelTraverse
