=begin
Sum square difference

The sum of the squares of the first ten natural numbers is:
1^2 + 2^2 + ... + 10^2 = 385
The square of the sum of the first ten natural numbers is:
(1 + 2 + ... + 10)^2 = 55^2 = 3025
Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
=end

def square_of_sum(num)
  sum = 0

  for i in 1..num
    sum += i
  end

  sum = sum**2
  sum
end

def sum_of_square(num)
  sum = 0

  for i in 1..num
    sum += i**2
  end

  sum
end

def sum_square_diff(num)
  diff = square_of_sum(num) - sum_of_square(num)
  diff
end

sum_square_diff(100) #=> 25164150
