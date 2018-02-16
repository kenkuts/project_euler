=begin
  Amicable Numbers

  Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
  If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

  For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
   The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

  Evaluate the sum of all the amicable numbers under 10000.

=end
require 'prime'

class Integer
  def dsum
    return 1 if self < 2
    prime_divisors = prime_division.flat_map{|ele, p| [ele] * p}
    ([1] + (1...prime_divisors.length).flat_map{ |e| prime_divisors.combination(e).map{ |f| f.reduce(:*) }}).uniq.inject(:+)
  end
end

def find_sum(n)
  n.times.inject do |sum, current|
    other = current.dsum
    if (current != other && other.dsum == current)
      sum + current
    else
      sum
    end
  end
end
find_sum(10000) #=> 31626
