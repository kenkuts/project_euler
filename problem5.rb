=begin
  Smallest Multiple
  2520 is the smallest number that can be divided by
  each of the numbers from 1 to 10 without any remainder.
  What is the smallest positive number that is evenly divisible
  by all of the numbers from 1 to 20?

=end

def smallest_multiple(num)

  number = 2520
  i = num

  while i > 0
    if number % i == 0 && i != 1
      i -= 1
    elsif number % i == 0 && i == 1
      ans = number
      i -= 1
    elsif number % i != 0
      number += 20
      i = num
    end
  end

  ans
end

smallest_multiple(20) #=> 232792560
