# Объединённое произведение - запись подряд произведений числа на 1, 2, 3
# 192 * (1, 2, 3) == 192384576
# Нати самое большое объединённое произведение, которое будет 9-значным и панцифровым (содержит все цифры 1..9) (932718654)

# приходит строка '123456789' - возвращаем true если подходит - панцифровое и 9-значное
def correct?(number)
  number.size == 9 && (number.chars & %w(1 2 3 4 5 6 7 8 9)).size == 9
end

def get_concatenated_product(number)
  ret = number.to_s
  2.upto(9) { |i| ret += (number * i).to_s; break if ret.size >= 9 }
  ret
end

p 2.upto(9999).map { |num| get_concatenated_product num }.select { |num| correct? num }.map(&:to_i).max

# ugly one-liner
p 2.upto(9999).map { |num| ret = num.to_s; 2.upto(9) { |i| ret += (num * i).to_s; break if ret.size >= 9 }; ret.size == 9 && (ret.chars & %w(1 2 3 4 5 6 7 8 9)).size == 9 ? ret.to_i : 0 }.max
