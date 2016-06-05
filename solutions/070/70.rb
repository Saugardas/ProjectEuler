# φ(87109)=79180; φ - функция Эйлера.
# Найти такое число n  1 < n < 107, для которого φ(n) - перестановка n и отношение n/φ(n) минимально (8319823, (8319823/8313928))

require_relative '../../extension'
arr = []
3.upto(9_999_999) do |n|
  totient = n.phi
  arr << [n, n/totient] if totient.to_i.to_s.chars.sort == n.to_s.chars.sort
end
p arr.min_by(&:last)