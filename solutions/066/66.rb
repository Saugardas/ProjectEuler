# Pell Equation - наибольший базовый корень уравнения x^2 - Dy^2 = 1, D = 1..1_000
# (D = 661, x = 16421658242965910275055840472270471049)

require_relative '../../lib/number_theory'

max = [0, 0]
1.upto(1_000).each do |d|
  x = NumberTheory.pells_equation(d).first
  max = [x, d] if max.first < x
end
p max
