



def reciprocal_cycles
  seq_len = 0
  counter = 1000
  while counter > 1
    break if seq_len >= counter

    remainders = Array.new(counter)
    value = 1
    pos = 0

    while remainders[value] == 0 and value != 0
      remainders[value] = pos
      value *= 10
      value %= counter
      pos += 1
    end

    if (pos - remainders[value]) > seq_len
      seq_len = pos - remainders[value]
    end
  end
  seq_len
end

reciprocal_cycles
