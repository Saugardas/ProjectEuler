# (510510)

p 2*3*5*7*11*13*17

require 'prime'

# Функция Эйлера
def phi num
  num * num.prime_division.map(&:first).map{|pr| 1 - 1r/pr}.reduce(:*)
end

p (2..1_000_000).map{|i| i/phi(i)}.each_with_index.max