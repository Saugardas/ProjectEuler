# Найти количество числе, меньших 10_000, квадртаный корень которых в виде цепной дроби имеет нечётные период (1322)

# возвращаем период дроби
def continued_fraction num
  m = [0]
  d = [1]
  a = [(num**0.5).truncate]
  loop do
    m << d.last*a.last - m.last
    d << (num - m.last**2)/d.last
    a << ((a.first + m.last)/d.last).truncate
    return a[1..-2] if m.zip(d, a).count([m.last, d.last, a.last]) == 2 # выходим, если набор уже встречался
  end
end

p (1..9_999).reject{|n| (n**0.5 % 1).zero? }.count{|n| continued_fraction(n).size.odd?}
