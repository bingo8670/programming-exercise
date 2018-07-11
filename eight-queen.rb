N=13
$col=[0]*N
$d1=[0]*(N*2)
$d2=[0]*(N*2)
$ret=0
def dfs(x)
   if x==N
       $ret+=1
   else
       N.times do |i|
           if $col[i]==0 and $d1[i+x]==0 and $d2[i-x+N]==0
               $col[i]=$d1[i+x]=$d2[i-x+N]=1
               dfs x+1
               $col[i]=$d1[i+x]=$d2[i-x+N]=0
           end
       end
   end
end
dfs 0
puts $ret
