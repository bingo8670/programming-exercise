# PSEUDOCODE

  # V=πr2L
  # V=L(R2cos−1(R−hR)−(R−h)2Rh−h2‾‾‾‾‾‾‾‾‾√)  gives the volume from a radius R, a height h and a length L.

  # Deconstruct vt to find L in above equation
  # L = (vt / Math.acos(-1)) / (Math.sqrt(radius))
  # pi in ruby is Math.acos(-1) => 3.14...
  # cos−1(1−x)+x(2−x)‾‾‾‾‾‾‾‾√(x−1) where x = h/r
  # Circle area = pi r sqrd
  # Circumference = 2*pi*r
        # without the l, should give the area of the portion of the circle filled.  Take the portion against the total circle area and use that percent times the total volume?

# CODE

def tankvol(h, d, vt)
  radius = d.to_f/2
  l = vt / (Math.acos(-1)*radius**2)
  cylindersectorarea = l*(radius**2*Math.acos((radius-h)/radius.to_f)-(radius-h)*Math.sqrt(2*radius*h-h**2))
  cylindersectorarea.floor
end


# DRIVER CODE

p tankvol(60,120,3500) # => 1750
p tankvol(40,120,3500) # => 1021 (calculation gives about: 1021.26992027)
p tankvol(80,120,3500) # => 2478 (calculation gives about: 2478.73007973)
p tankvol(5, 7, 3848) # => 2940
