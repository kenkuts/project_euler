=begin
  Largest Prime Factor
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143 ?
=end

def largest_prime_factor(num)
  prime_factors = []

  for i in 2..num
    while (num % i == 0)
      prime_factors.push(i)
      num /= i
    end
    break if num == 1
  end
  prime_factors[prime_factors.length - 1]
end

largest_prime_factor(600851475143) #=> 6857
