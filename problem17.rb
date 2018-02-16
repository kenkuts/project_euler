=begin
  Number letter counts
  If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
=end
class Fixnum
  def num_obj                                                                               # This is where we store our number to word hash
    {
      1 => "one",  2 => "two", 3 => "three", 4 => "four", 5 => "five",
      6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten",
      11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen",
      15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
      19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty",
      60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety"
    }
  end

  def place_obj                                                                             # This is where we store our numbers to place hash
    {
       100 => "hundred", 1000 => "thousand"
    }
  end

  def in_words                                                          # in_words method's main purpose it to return a string conversion of our number

    if (self === 0)                                                     # If the number is equal to 0 just return string "zero"
      return "zero"
    end

    number_string = []                                          # Create our empty array that stores all the words for each numbers place

    if (1..20).include?(self)                                   # If the number is between 1 to 20 if condition is proced
      number_string.push(num_obj[self])                         # Since the all numbers from 1 to 20 is a key it will push the value inside number_string

    elsif (21..99).include?(self)                               # If it is from 21 to 99
      if self % 10 > 0                                          # and the number is 10 mod > 0 then
        number_string.push(num_obj[self - (self % 10)])         # the number itself is minus the modded num to get the tens value ie: 31 - (31 % 10) = 30  "thirty"
        number_string.push(num_obj[self % 10])                  # then the remainder is pushed to get the ones value. ie: 31 % 10 = 1  "one"
      else                                                      # if the num % 10 == 0
        number_string.push(num_obj[self])                       # then the tens number word is pushed
      end

    elsif (100..999).include?(self)                             # If the range is from 100 to 999
      # number_string.push(place_numbers(self, 100))              # the number and the place is pushed in to another function

      # Verbose code/ Contents of our helper function
      if self % 100 > 0
        number_string.push(num_obj[self / 100])
        number_string.push("hundred and")
        number_string.push((self % 100).in_words)
      else
        number_string.push(num_obj[self / 100])
        number_string.push("hundred")
      end

    elsif (1000..99999).include?(self)                          # The thousands range
      number_string.push(place_numbers(self, 1000))
    end

    number_string.join(" ")
  end

  def place_numbers(number, place)
    string = []
    if number % place > 0
      string.push((number / place).in_words)
      string.push(place_obj[place])
      string.push((number % place).in_words)
    else
      string.push((number / place).in_words)
      string.push(place_obj[place])
    end
    string.join(" ")
  end
end

def number_letter_counts(number)
  letter_count = 0
  accum = 0
  str = []

  for i in 1..number
    str = i.in_words
    str = str.split("")
    for j in 1..str.length
      if str[j] != " "
        letter_count += 1
      end
    end
    accum += letter_count
    letter_count = 0
  end

  accum += letter_count
  letter_count = 0
  accum
end


number_letter_counts(1000) #=> 21124
