# (26241)

require 'prime'

# Каждый раз получаем 4 числа диагонали
def diagonals
  buttom_right = 3
  loop do
    yield Array.new(4) { |i| buttom_right**2 - i * (buttom_right - 1) }
    buttom_right += 2
  end
end

common = 1 # число 1 уже есть в середине
primes = 0 # число простых чисел
diagonals do |set|
  common += 4
  primes += set[1..-1].count(&:prime?) # первое число не проверяем, тк не простое (квадрат)
  p set[0]**0.5 and break if common / primes >= 10 # длина квадрата - корень нижнего правого угла
end
