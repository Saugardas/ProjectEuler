# Для первых ста натуральных чисел, корень которых иррационален, найти сумму первых 100 цифр
# в десятичном представлении и сложить эти сто сумм
# (40886)

require_relative '../../lib/number_theory'
require 'bigdecimal'

# используя BigDecimal =================================================================================================
p (2..99).reject { |n| NumberTheory.square?(n) }.sum { |num| BigDecimal(num).sqrt(100).to_s[2..101].chars.sum(&:to_i) }

# используя разложение в цепную дробь ==================================================================================

def get_extended_period(cont)
  (cont * (200 / cont.size))[0..200]
end

# возвращаем приближение из числа в виде цепной дроби
# int_part - целая часть, cont_part - период цепной дроби
def from_continued(int_part, cont_part)
  common_fract = 0 # дробная часть
  # если период дроби чётный - берём для приблежения его, кроме последнего числа
  cont_part = if cont_part.size.even?
                cont_part[0..-2]
              # если период нечётный - то двойной период без последнего числа
              else
                (cont_part * 2)[0..-2]
              end
  cont_part.reverse_each do |fr|
    common_fract = Rational(1.0, (fr + common_fract))
  end
  common_fract + int_part
end

# limit символов после запятой
def find_digits(numer, denom, limit)
  digs = []
  limit.times do
    res, numer = (numer * 10).divmod(denom)
    digs << res
  end
  digs
end

# находим сумму первых ста цифр числа
def get_sum_of_digits(number)
  # находим цепную дробь
  big_fract = NumberTheory.continued_fraction(number)
  # преобразуем её в большую дробь
  num = from_continued(0, get_extended_period(big_fract.last))
  # одно число до запятой и 99 после
  big_fract.first + find_digits(num.numerator, num.denominator, 99).sum
end

p (2..99).reject { |n| NumberTheory.square?(n) }.sum { |num| get_sum_of_digits(num) }
