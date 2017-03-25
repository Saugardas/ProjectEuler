require 'prime'

class Integer
  # находим делители числа.
  # [..] если nil
  # [1..] если false
  # [1..self] если true
  def divisors_list(extreme = nil)
    list = extreme ? [1, self] : (extreme.nil? ? [] : [1])
    (2..Math.sqrt(self).floor).each do |i|
      list << i << self / i if (self % i).zero?
    end
    list.uniq.sort
  end

  # находим число делителей числа.
  # [..] если nil
  # [1..] если false
  # [1..self] если true
  def divisors_count(extreme = nil)
    count = extreme ? 2 : (extreme.nil? ? 0 : 1)
    (2..Math.sqrt(self).floor).each do |i|
      count += 2 if (self % i).zero?
    end
    square? ? count - 1 : count # для квадратов посчитали два раза
  end

  # true - число является квадратом
  def square?
    return false if negative?
    (Math.sqrt(self) % 1).zero?
  end

  # Функция Эйлера, равная количеству натуральных чисел, меньших n и взаимно простых с ним.
  def phi
    return 0 if self < 1
    return self - 1 if prime?
    self * prime_division.map(&:first).map { |pr| 1 - 1r / pr }.reduce(:*) rescue 1
  end
end
