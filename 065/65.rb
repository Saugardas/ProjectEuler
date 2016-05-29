# Найти сумму цифр в числителе дроби, являющейся 100м приближением числа е, полученного из цепной дроби представления числа е (272)

cont_fract = (1..99).map {|i| i % 3 == 2 ? 2*(i + 1)/3 : 1 }.reverse
# находим дробную часть
b = 0
cont_fract.each do |fr|
  b = Rational(1.0, (fr + b))
end

p (b + 2).numerator.to_s.chars.map(&:to_i).reduce(:+)