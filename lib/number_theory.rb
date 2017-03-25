# frozen_string_literal: true
module NumberTheory
  # возвращает корень из number в виде цепной дроби
  # [целая часть, [период]]
  def self.continued_fraction(number)
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

  # true - число является квадратом
  def self.square?(number)
    return false if number.negative?
    (Math.sqrt(number) % 1).zero?
  end
end
