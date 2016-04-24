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
    list.sort
  end

end