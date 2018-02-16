=begin
  Quadratic Primes
  Considering quadratics of the form:

  n2+an+bn2+an+b, where |a|<1000|a|<1000 and |b|≤1000|b|≤1000

  where |n||n| is the modulus/absolute value of nn
  e.g. |11|=11|11|=11 and |−4|=4|−4|=4
  Find the product of the coefficients, aa and bb, for the quadratic expression that produces the maximum number of primes for consecutive values of nn, starting with n=0n=0.

=end

def quadratic_primes
  a_max = 0
  b_max= 0
  n_max = 0

  for a in -1000..1000
    for b in -1000..1000
      n = 0
      while isPrime?((n * n + a * n + b).abs)
        n += 1
      end

      if (n > n_max)
        a_max = a
        b_max = b
        n_max = n
      end
    end
  end
  return (a_max * b_max)
end

def isPrime?(num)
  if num < 2
    return false
  end


  for i in 2...num
    if num % i == 0
      return false
    end
  end

  return true
end

quadratic_primes #=> 64998
