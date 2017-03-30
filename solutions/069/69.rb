# (510510)

p 2 * 3 * 5 * 7 * 11 * 13 * 17
require_relative '../../lib/number_theory'

p (2..1_000_000).map { |i| i / NumberTheory.euler_phi(i) }.each_with_index.max
