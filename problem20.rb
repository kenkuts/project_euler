=begin
  Factorial Digit Sum

  n! means n × (n − 1) × ... × 3 × 2 × 1

  For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
  and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

  Find the sum of the digits in the number 100!
=end

def factorial_digit_sum(num)
  sum = 1
  accum = 1

  for i in 1..num
    sum *= accum
    accum += 1
  end
  sum = sum.to_s.split("").map{|ele| ele.to_i}.reduce(:+)
  sum
end
factorial_digit_sum(100) #=> 648
