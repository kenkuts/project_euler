=begin
  Longest Collatz sequence

  The following iterative sequence is defined for the set of positive integers:
  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
=end

def longest_collatz

  sequence_number = 1
  sequence = 0
  longest = 0
  num = 0

  for i in 2..1000000
    sequence = i

    while sequence != 1

      if sequence % 2 == 0
        sequence /= 2
      else
        sequence = (3 * sequence) + 1
      end

      sequence_number += 1
    end

    if sequence_number > longest
      longest = sequence_number
      num = i
    end
    sequence_number = 1
  end

  puts "The number #{num} produces the longest chain. With #{longest} sequences"
end

longest_collatz
