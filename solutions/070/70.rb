# φ(87109)=79180; φ - функция Эйлера.
# Найти такое число n  1 < n < 107, для которого φ(n) - перестановка n и отношение n/φ(n) минимально (8319823, (8319823/8313928))

require 'prime'

# Функция Эйлера (всегда четная для num > 2)
def phi num
  return 1 if num < 2
  return num - 1 if num.prime?
  num * num.prime_division.map(&:first).map{|pr| 1 - 1r/pr }.reduce(:*)
end

arr = []
3.upto(9_999_999) do |n|
  totient = phi(n)
  arr << [n, totient, n/totient] if totient.to_i.to_s.chars.sort == n.to_s.chars.sort
end
p arr.min_by(&:last)