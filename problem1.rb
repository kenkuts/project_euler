=begin  Multiples of 3 and 5
If we list all the natural numbers below
10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
=end
def factors_sum(num1, num2, limit)
  accum = 0

  for i in 1...limit
    if i % num1 == 0 || i % num2 == 0
        accum += i
    end
  end
  accum
end

puts factors_sum(3,5,1000) #=> 233168
