# Последовательность сумм чисел 1, 3, 6, 10, 15, где Ч(и) = сумма(1..число)
# Найти первое число в этой последовательности, которое имеет > 500 делителей

require_relative '../../extension'

sum = 1
2.upto(500_000) do |i|
  sum += i
  rez = sum.divisors_count(true)
  if rez > 500
    p "Число #{sum} имеет #{rez} делителей"
    break
  end
end