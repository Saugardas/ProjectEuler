require 'prime'

class Integer
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
end
