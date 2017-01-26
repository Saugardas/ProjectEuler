# найти среди чисел a^b (a, b < 100) число с наибольшей суммой цифр (972)
arr = []
2.upto(99) do |a|
  2.upto(99) do |b|
    arr << (a**b).digits.reduce(:+)
  end
end
p arr.max

p (2..99).flat_map { |a| (2..99).map { |b| (a**b).digits.reduce(:+) } }.max
