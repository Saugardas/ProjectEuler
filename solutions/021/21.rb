# Посчитать сумму дружественных чисел, меньших 10_000 (31626)
require_relative '../../lib/number_theory'

amicable_numbers = []
2.upto(10_000) do |i|
  next if amicable_numbers.include? i
  pretender = NumberTheory.divisors_list(i).sum
  amicable_numbers << i << pretender if pretender != i && NumberTheory.divisors_list(pretender).sum == i
end
p amicable_numbers.sum
