# Найти количество числе, меньших 10_000, квадртаный корень которых в виде цепной дроби имеет нечётные период (1322)

require_relative '../../extension'

p (1..9_999).reject(&:square?).count{|n| n.continued_fraction.last.size.odd?}
