=begin
  Digit Fifth powers
  Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

  1634 = 14 + 64 + 34 + 44
  8208 = 84 + 24 + 04 + 84
  9474 = 94 + 44 + 74 + 44
  As 1 = 14 is not a sum it is not included.

  The sum of these numbers is 1634 + 8208 + 9474 = 19316.

  Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
=end

def digit_fifth_powers
  result = 0
  for i in 2...500000
    sum = 0
    num = i
    while num > 0
      n = num % 10
      num /= 10

      temp = n
      for j in 1...5
        temp *= n
      end
      sum += temp
    end

    if sum == i
      result += i
    end
  end

  result
end

digit_fifth_powers #=> 443839
