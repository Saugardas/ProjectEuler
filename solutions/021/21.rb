# Посчитать сумму дружественных чисел, меньших 10_000
require_relative '../../divider'

amicable_numbers = []
2.upto(10_000) do |i|
  next if amicable_numbers.include? i
  pretender = i.divisors_list(false).reduce :+
  amicable_numbers << i << pretender if pretender != i and pretender.divisors_list(false).reduce(:+) == i
end
p amicable_numbers.reduce :+