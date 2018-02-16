=begin
  Maximum path sum I

  By starting at the top of the triangle below and moving to adjacent numbers on the row below,
  the maximum total from top to bottom is 23.

  3
  7 4
  2 4 6
  8 5 9 3

  That is, 3 + 7 + 4 + 9 = 23.
=end
def max_path_sum
    triangle = "75 0 0 0 0 0 0 0 0 0 0 0 0 0 0
              95 64 0 0 0 0 0 0 0 0 0 0 0 0 0
              17 47 82 0 0 0 0 0 0 0 0 0 0 0 0
              18 35 87 10 0 0 0 0 0 0 0 0 0 0 0
              20 04 82 47 65 0 0 0 0 0 0 0 0 0 0
              19 01 23 75 03 34 0 0 0 0 0 0 0 0 0
              88 02 77 73 07 63 67 0 0 0 0 0 0 0 0
              99 65 04 28 06 16 70 92 0 0 0 0 0 0 0
              41 41 26 56 83 40 80 70 33 0 0 0 0 0 0
              41 48 72 33 47 32 37 16 94 29 0 0 0 0 0
              53 71 44 65 25 43 91 52 97 51 14 0 0 0 0
              70 11 33 28 77 73 17 78 39 68 17 57 0 0 0
              91 71 52 38 17 14 91 43 58 50 27 29 48 0 0
              63 66 04 68 89 53 67 30 73 16 69 87 40 31 0
              04 62 98 27 23 09 70 98 73 93 38 53 60 04 23".split(" ")      # First we convert the triangle into an array
  triangle.map!{|el| el.to_i}                                     # Map each array into an integer
  new_tri = Array.new(15) { Array.new(15) }                       # Create our 15x15 array to store our set of 2d arrays
  accum = 0

  for i in 0...15                                 # Create outter loop
    for j in 0...15                               # Create inner loop
      new_tri[i][j] = triangle[accum]             # Store each 1d array integer into 2d array
      accum += 1                                  # accumulate 1d index
    end
  end
  i = new_tri.length - 2                          # Set i to new_tri.length - 2(meaning second to the last triangle row)
  while i >= 0                                    # Create outter loop
    for j in 0..i                                 # Create inner loop
      new_tri[i][j] += [new_tri[i + 1][j], new_tri[i + 1][j + 1]].max   # Each time we iterate we get the max out of two numbers(from
    end                                                               # left to right) below our current element. Meaning if current index is new_tri[13][0] = 63
    i -= 1                                                            # below it is new_tri[14][0] = 4 and new_tri[14][1] = 62 the max is 62 and it will be added to 63
  end                                                                 # the sum value will be stored in the current element. We do this for the whole 2d array.
  new_tri[0][0]                                                       # eventually we get the maximum path sum added to the root node.
end

max_path_sum  #=> 1074
