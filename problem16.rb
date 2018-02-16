=begin
  Power digit sum

  2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
  What is the sum of the digits of the number 2^1000?
=end

def power_digit_sum(power)

  number = 2**power

  number = number.to_s.split("").map{|ele| ele.to_i}.reduce(:+)

  number
end
power_digit_sum(1000) #=> 1366
power_digit_sum(15) #=> 26
