=begin
  Largest product in a grid

  In the 20×20 grid below, four numbers along a diagonal line have been marked in red.
=end

def largest_product
  grid ="08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
        49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
        81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
        52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
        22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
        24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
        32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
        67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
        24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
        21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
        78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
        16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
        86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
        19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
        04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
        88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
        04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
        20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
        20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
        01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48".split(" ") # split our set of number strings

  grid.map!{|ele| ele.to_i}                             # by using map bang method we convert each element str into an int

  new_grid = Array.new(20) { Array.new(20) }            # create a 20 X 20 2d array
  accum = 0                                             # set accumulator to 0

  for i in 0...20                                       # outer loop(row)
    for j in 0...20                                     # inner loop(column)
      new_grid[i][j] = grid[accum]                      # assign each row/col == a number on the new grid
      accum += 1                                        # grid array goes from start to end thanks to accumulator
    end
  end

  current = 0                                           # declare current var
  largest = 0                                           # declare largest var

  for row in 0...new_grid.length                        # create our new large product finder(outter loop)
    for col in 0...new_grid[row].length                 # inner loop

      current = [[check_vert(new_grid, row, col), check_hor(new_grid, row, col)].max, # find max for each position
      [check_Ldiag(new_grid, row, col), check_Rdiag(new_grid, row, col)].max].max     # vert, horiz, Rdiag and Ldiag
                                                                                      # store max to current
      if current > largest                              # compare and find each current
        largest = current                               # set largest to largest product
      end
    end
  end

  puts "The largest product in the grid is #{largest}"  # print out largest current product in the grid

end




def check_hor(array, row, col)              # This checks the highest 4 horizontal sets of products numbers
  product = 1                               # product is 1

  if col + 3 >= array[row].length           # if our col goes over the rows length its going
    return 0                                # to return a 0. This is because each col is the same
  end                                       # amount as each row and if goes over the value is 0.

  i = col                                   # set i = col
  while i <= (col + 3)                      # we want the product of four numbers from the current col
    product *= array[row][i]                # only the col changes. we are iterating through 4 elements
    i += 1                                  # increment i by 1 until it goes to 4
  end
  product                                   # return product
end




def check_vert(array, row, col)             # This does the same thing but it checks for the vertical 4
  product = 1                               # set of numbers

  if row + 3 >= array.length                # if the row index + 3 is >= to the grid(row).length return 0
    return 0
  end

  i = row                                   # set i = row
  while i <= (row + 3)
    product *= array[i][col]                # the row index changes and the column is the same, every elem is multipied
    i += 1                                  # i increments to move from top to bottom of the grid
  end
  product                                   # return product
end




def check_Rdiag(array, row, col)                # this checks our values from the right down diagonally
  product = 1

  if row + 3 >= array.length || col + 3 >= array.length     # if both (row or col) + 3 => grid.length
    return 0                                                # return 0
  end

  i = row                                         # set i to row
  j = col                                         # j to col

  while i <= row + 3 and j <= col + 3             # it must not exceed 3 elements
    product *= array[i][j]                        # multiply each element
    i += 1                                        # increment i
    j += 1                                        # increment j
  end

  product                                         # return product
end



def check_Ldiag(array, row, col)                  # get Ldiag
  product = 1

  if row + 3 >= array.length || col - 3 < 0       # here our col has a different condition we will decrement col
    return 0                                      # while we increment row hence why col needs to be more than 0
  end

  i = row
  j = col

  while i <= row + 3 and i >= col - 3             # set conditions for while loop
    product *= array[i][j]                        # as row increments our col decrements hence the L diagonal
    i += 1
    j -= 1
  end

  product                                         # return product
end

largest_product
