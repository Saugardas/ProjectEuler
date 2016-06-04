# Pell Equation - наибольший базовый корень уравнения x^2 - Dy^2 = 1, D = 1..1_000 (D = 661, x = 16421658242965910275055840472270471049)

require_relative '../../extension'

def continued_fraction num
  m = [0]
  d = [1]
  a = [(num**0.5).truncate]
  loop do
    m << d.last*a.last - m.last
    d << (num - m.last**2)/d.last
    a << ((a.first + m.last)/d.last).truncate
    return [a[0], a[1..-2]] if m.zip(d, a).count([m.last, d.last, a.last]) == 2 # выходим, если набор уже встречался
  end
end

# возвращаем приближение из числа в виде цепной дроби
# int_part - целая часть, cont_part - период цепной дроби
def from_continued int_part, cont_part
  common_fract = 0 # дробная часть
  # если период дроби чётный - берём для приблежения его, кроме последнего числа
  if cont_part.size.even?
    cont_part = cont_part[0..-2]
  # если период нечётный - то двойной период без пследнего числа
  else
    cont_part = (cont_part*2)[0..-2]
  end
  cont_part.reverse.each do |fr|
    common_fract = Rational(1.0, (fr + common_fract))
  end
  common_fract + int_part
end

max = [0, 0]
1.upto(1_000).each do |d|
  next if d.square? # для квадратов нет решения
  x = from_continued(*continued_fraction(d)).numerator
  max = [x, d] if max.first < x
end
p max