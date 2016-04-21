# Последовательность сумм чисел 1, 3, 6, 10, 15, где Ч(и) = сумма(1..число)
# Найти первое число в этой последовательности, которое имеет > 500 делителей

def find_list_of_divisor number
  # находим делители числа. Включаем 1 и само число
  count = 2
  (2..(Math.sqrt(number)).floor).each do |i|
    count += 2 if (number%i).zero? # число и результат деления на него
  end
  count
end

sum = 1
2.upto(500_000) do |i|
  sum += i
  rez = find_list_of_divisor(sum)#.size
  if rez > 500
    p "Число #{sum} имеет #{rez} делителей"
    break
  end
end