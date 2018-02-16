=begin
  Special Pythagorean triplet
  A Pythagorean triplet is a set of three
  natural numbers, a < b < c, for which,

  a2 + b2 = c2
  For example, 32 + 42 = 9 + 16 = 25 = 52.

  There exists exactly one Pythagorean triplet
  for which a + b + c = 1000. Find the product abc.

=end

def special_pyth_triplet(number)

  for i in 1...number/2
    a = i
    for j in 1...number/2
      b = j

      c = number - a - b
      if (a**2 + b**2 == c**2)
        puts "#{a} * #{b} * #{c} = #{a * b * c}"
        break
      end
    end
    break if (a**2 + b**2 == c**2)
  end
end

special_pyth_triplet(1000) #=> 31875000
