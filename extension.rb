class Integer

  # находим делители числа.
  # [..] если nil
  # [1..] если false
  # [1..self] если true
  def divisors_list extreme = nil
    list = extreme ? [1, self] : (extreme.nil? ? [] : [1])
    (2..(Math.sqrt(self)).floor).each do |i|
      list << i << self/i if (self % i).zero?
    end
    list.uniq.sort
  end

  # находим число делителей числа.
  # [..] если nil
  # [1..] если false
  # [1..self] если true
  def divisors_count extreme = nil
    count = extreme ? 2 : (extreme.nil? ? 0 : 1)
    (2..(Math.sqrt(self)).floor).each do |i|
      count += 2 if (self % i).zero?
    end
    self.square? ? count - 1 : count # для квадратов посчитали два раза
  end

  # true - число является квадратом
  def square?
    return false if self.negative?
    (Math.sqrt(self) % 1).zero?
  end

  # возвращем цепную дробь sqrt(self)
  # [целая часть, [период]]
  def continued_fraction
    m = [0]
    d = [1]
    a = [(self**0.5).truncate]
    loop do
      m << d.last*a.last - m.last
      d << (self - m.last**2)/d.last
      a << ((a.first + m.last)/d.last).truncate
      return [a[0], a[1..-2]] if m.zip(d, a).count([m.last, d.last, a.last]) == 2 # выходим, если набор уже встречался
    end
  end

end