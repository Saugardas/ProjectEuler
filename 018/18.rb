# Имеется "треугольник" чисел. Найти последовательность сверху до низа, что
# имеет наибольшую сумму. Аналог №67, но с гораздо меньшим объёмом вычислений

# читаем из файла данные; преобразуем их в массив цифр
def each_line
  File.open('PE_18') do |file|
    file.each_line {|line| yield line.chop.split(" ").map(&:to_i)}
  end
end

# возвращает сумму двух массивов, длина второго больше первого на 1
def sum_of_two_arrays(arr, arr2)
  summ = []
  arr1 = [-Float::INFINITY] + arr + [-Float::INFINITY]
  arr2.each_with_index do |el, i|
    summ[i] = [el + arr1[i], el + arr1[i+1]].max
  end
  summ
end

old_line = [0]
each_line do |next_line|
  # суммируем
  old_line = sum_of_two_arrays(old_line, next_line)
end
p old_line.max