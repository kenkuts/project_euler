=begin
  10001st prime

  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
  we can see that the 6th prime is 13.

  What is the 10 001st prime number?
=end

def nth_prime(num)
  primes = []
  i = 2

  while primes.length != num
    if isPrime?(i)
      primes << i
    end
    i += 1
  end

  primes[primes.length - 1]
end

def isPrime?(num)
  if num < 2
    false
  end

  for i in 2...num
    if num % i == 0
      return false
    end
  end

  true
end

nth_prime(10001) #=> 104743
