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
    (Math.sqrt(self) % 1).zero? ? count - 1 : count # для квадратов посчитали два раза
  end

end