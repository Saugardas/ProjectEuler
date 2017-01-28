# Посчитать сумму дружественных чисел, меньших 10_000 (31626)
require_relative '../../extension'

amicable_numbers = []
2.upto(10_000) do |i|
  next if amicable_numbers.include? i
  pretender = i.divisors_list(false).sum
  amicable_numbers << i << pretender if pretender != i and pretender.divisors_list(false).sum == i
end
p amicable_numbers.sum
