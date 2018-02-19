=begin
  Number Spiral Diagonals

  Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

  21 22 23 24 25
  20  7  8  9 10
  19  6  1  2 11
  18  5  4  3 12
  17 16 15 14 13

  It can be verified that the sum of the numbers on the diagonals is 101.

  What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

=end
def number_spiral_diagonals(limit)
  totalSum = 1

  for i in 0...limit
    totalSum += 4*(i**2)+(6*i)+3
    totalSum += 4*(i**2)+(10*i)+7
    totalSum += 4*(i**2)+(8*i)+5
    totalSum += 4*(i**2)+(12*i)+9
  end

  puts totalSum
end

number_spiral_diagonals(500)
