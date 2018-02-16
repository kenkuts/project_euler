=begin
  Highly divisible triangular number

  The sequence of triangle numbers is generated by adding the
  natural numbers. So the 7th triangle number would be
  1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

  1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
  Let us list the factors of the first seven triangle numbers:
   1: 1
   3: 1,3
   6: 1,2,3,6
  10: 1,2,5,10
  15: 1,3,5,15
  21: 1,3,7,21
  28: 1,2,4,7,14,28
  We can see that 28 is the first triangle number to have over five divisors.
  What is the value of the first triangle number to have over five hundred divisors?
=end

def highly_tri(limit)
  divisors = 0
  accum = 0
  triangle_num = 0

  while divisors <= limit
    divisors = 0
    accum += 1
    triangle_num += accum

    for i in 1..Math.sqrt(triangle_num)
      if triangle_num % i == 0
        divisors += 2
      end
    end

    if Math.sqrt(triangle_num) * Math.sqrt(triangle_num) == triangle_num
      divisors -= 1
    end
  end

  triangle_num
end

highly_tri(500) #=> 76576500
# highly_tri(5)   #=> 28
