#for triangle in %w[▲]
#  puts triangle
#end

triangle = <<EOF
*
* *
*   *
* * * *
EOF

for line in triangle.lines
  puts line
end
