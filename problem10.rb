=begin
  Summation of primes
  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
  Find the sum of all the primes below two million.
=end

# Easiest method without having my computer crash.
# require 'prime'
# answer = Prime.each(2000000).inject(:+) #=>142913828922
# puts answer

# Brute Force Method:
def summation_of_primes(limit)
  primes = [2]
  accum = 3

  while primes[primes.length - 1] < limit

    if primes.all?{|ele| accum % ele != 0}
      primes << accum
    end
    accum += 2

  end
  primes.pop
  # p primes
  sum = primes.reduce(:+)
  sum
end

summation_of_primes(2000000) #=> 142913828922
# summation_of_primes(10) #=> 17
