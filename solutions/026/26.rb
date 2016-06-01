# Найти значение d < 1000, для которого 1/d в десятичном виде содержит самую длинную
# повторяющуюся последовательность цифр

# делим столбиком, пока не зациклимся
def long_division dividend, divisor
  numbers = [0]
  xesh = {}
  loop do
    return 0 if dividend.zero?
    dividend *= 10
    if xesh[dividend] # то с числа dividend - у нас повторяющаяся последовательность
      return numbers[numbers.index(xesh[dividend])..-1].size
    end
    xesh[dividend], ost = dividend.divmod divisor
    numbers << xesh[dividend]
    dividend = ost
  end
end

max = 0
1_000.downto(2) do |i|
  rez =  long_division 1, i
  max = rez if rez > max
  break if i < max # длина зацикленной части не может быть больше делителя
end
p max
