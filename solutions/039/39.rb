# Некоторый числа - есть сумма пифагоровых троек
# Найти число, <= 1000, имеющее наибольшое число троек (840 - 3)

MAX = 1_000

def get_pythagorean_triples(m, n)
  c = (m * m) + (n * n)
  Array.new(MAX / c) { |i| [(i + 1) * 2 * m * n, (i + 1) * (m * m - n * n), (i + 1) * c].sort }
end

max_c = Math.sqrt(MAX).floor  # ~ максимальная гипотенуза
arr = []

1.upto(max_c - 1) do |i|
  (i + 1).upto(max_c) do |y|
    arr += get_pythagorean_triples(y, i)
  end
end

p arr.uniq.map(&:sum).select { |el| el <= MAX }.each_with_object(Hash.new(0)) { |el, h| h[el] += 1 }.sort_by(&:last).last
