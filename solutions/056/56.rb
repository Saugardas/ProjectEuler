# найти среди чисел a^b (a, b < 100) число с наибольшей суммой цифр (972)
p [*2..99].product([*2..99]).map { |a, b| (a**b).digits.sum }.max

p (2..99).flat_map { |a| (2..99).map { |b| (a**b).digits.sum } }.max
