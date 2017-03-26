# 756872327473
require_relative '../../lib/number_theory'

# (x-q)/x * (x-q-1)/(x-1) = 1/2
# x^2 + (-4q-1)x + 2q + 2q^2 => D = 8q^2 + 1; x = ((4q+1) + sqrt(D)) / 2
# тк и q и sqrt(D) (d) должны быть целыми, решаем уравенине Пелля d^2 - 8q^2 = 1

NumberTheory.pells_equation_generator(8) do |discr_sqrt, q|
  x = (4 * q + 1 + discr_sqrt) / 2
  p "#{x - q}/#{x}"
  break if x > 10**12
end
