# Количество чисел менее 10млн, цикл суммы квадратов цифр которых сходится к 89(8581146)

def sum_of_squares(num)
  num.to_s.chars.map { |i| i.to_i**2 }.reduce(:+)
end

@numbers = { 89 => true, 1 => false } # без хеша 2мин, с ни - 57 сек

def correct_number?(number)
  num = number
  loop do
    num = sum_of_squares(num)
    if @numbers.key?(num)
      @numbers[number] = @numbers[num]
      return @numbers[num]
    end
  end
end

p (1..9_999_999).count { |num| correct_number?(num) }
