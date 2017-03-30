# frozen_string_literal: true
require 'prime'

module NumberTheory
  # возвращает корень из number в виде цепной дроби
  # [целая часть, [период]]
  def self.continued_fraction(number)
    return [Math.sqrt(number), []] if square?(number)
    m = [0]
    d = [1]
    a = [(number**0.5).truncate]
    loop do
      m << d.last * a.last - m.last
      d << (number - m.last**2) / d.last
      a << ((a.first + m.last) / d.last).truncate
      return [a[0], a[1..-2]] if m.zip(d, a).count([m.last, d.last, a.last]) == 2 # выходим, если набор уже встречался
    end
  end

  # находит фундаментальное решение уравнения Пелля x^2 - dy^2 = 1
  def self.pells_equation(d)
    return [1, 0] if square?(d) # для d - являющихся квадратами, нет нетривиальных решений
    int_part, cont_part = continued_fraction(d)
    common_fract = 0 # дробная часть
    # если период дроби чётный - берём его для приблежения, кроме последнего числа
    # если период нечётный - то двойной период без последнего числа
    cont_part = cont_part.size.even? ? cont_part[0..-2] : (cont_part * 2)[0..-2]
    cont_part.reverse_each do |fr|
      common_fract = Rational(1.0, (fr + common_fract))
    end
    res = common_fract + int_part
    [res.numerator, res.denominator]
  end

  # решение уравнения Пелля x^2 - dy^2 = 1, возвращает пару (x, y) в блок
  def self.pells_equation_generator(d)
    x1, y1 = pells_equation(d) # первая пара
    x, y = x1, y1
    loop do
      yield x, y
      next_x = x1 * x + d * y1 * y
      next_y = x1 * y + y1 * x
      x, y = next_x, next_y
    end
  end

  # true - число является квадратом
  def self.square?(number)
    return false if number.negative?
    (Math.sqrt(number) % 1).zero?
  end

  # Функция Эйлера, равная количеству натуральных чисел, меньших n и взаимно простых с ним.
  def self.euler_phi(number)
    raise RangeError if number < 1
    return 1 if number == 1
    return number - 1 if number.prime?
    number * number.prime_division.map(&:first).map { |pr| Rational(pr - 1, pr) }.reduce(:*)
  end
end
