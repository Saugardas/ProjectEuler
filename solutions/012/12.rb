# Последовательность сумм чисел 1, 3, 6, 10, 15, где Ч(и) = сумма(1..число)
# Найти первое число в этой последовательности, которое имеет > 500 делителей (76576500)

require_relative '../../lib/number_theory'

sum = 1
2.upto(500_000) do |i|
  sum += i
  rez = NumberTheory.divisors_count(sum)
  if rez > 500
    p "Число #{sum} имеет #{rez} делителей"
    break
  end
end
