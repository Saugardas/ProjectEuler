# φ(87109)=79180; φ - функция Эйлера.
# Найти такое число n  1 < n < 107, для которого φ(n) - перестановка n и отношение n/φ(n) минимально (8319823, (8319823/8313928))

require_relative '../../lib/number_theory'
arr = []
3.upto(9_999_999) do |n|
  totient = NumberTheory.euler_phi(n)
  arr << [n, n / totient] if totient.to_i.digits.sort == n.digits.sort
end
p arr.min_by(&:last)
