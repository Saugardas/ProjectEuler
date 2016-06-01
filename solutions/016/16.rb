# What is the sum of the digits of the number 2^1000?
p (2**1000).to_s.chars.map(&:to_i).reduce :+


