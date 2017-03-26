# Найти количество числе, меньших 10_000, квадртаный корень которых в виде цепной дроби имеет нечётные период (1322)

require_relative '../../lib/number_theory'

p (1..9_999).count { |n| NumberTheory.continued_fraction(n).last.size.odd? }
