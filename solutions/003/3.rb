# Найти наибольший простой множитель числа 600_851_475_143 (6857)
number = 600_851_475_143
3.step(number / 2, 2) do |i|
  break if number == i
  number /= i if (number % i).zero?
end
p number
