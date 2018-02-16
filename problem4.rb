=begin
  Largest Palindrome Product
  A palindromic number reads the same both ways. The largest
  palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  Find the largest palindrome made from the product of two 3-digit numbers.

=end

def largest_palindrome
  largest = 0

  for i in 100..999
    x = i + 1
    for j in i..999

      current = i * j
      if isPalindrome?(current.to_s) && current > largest
        largest = current
      end

    end
  end
    largest
end

def isPalindrome?(word)
  reverse = word.reverse()
  reverse == word ? true: false
end

largest_palindrome #=> 906609
