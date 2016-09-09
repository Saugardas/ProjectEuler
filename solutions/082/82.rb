# Дана матрица 80 на 80, можно идти вниз, вверх и вправо. Найти путь с минимальной суммой
# 260324

# возвращаем сумму в стоблце column от from до to
def get_horizontal(column, from, to)
  ret = []
  from.send((from > to ? :downto : :upto), to) do |ind|
    ret << @matrix[ind][column]
  end
  ret.reduce(:+)
end

@matrix = File.open('PE_82').each_line.map { |line| line.scan(/\d+/).map(&:to_i) }
SIZE = @matrix.size

1.upto(SIZE - 1) do |column|
  # получаем новый стобец
  new_column = Array.new(SIZE) do |row|
    Array.new(SIZE) { |i| @matrix[i][column - 1] + get_horizontal(column, i, row) }.min
  end
  if column == SIZE - 1
    p new_column.min # минимальный путь
  else
    # меняем столбец
    new_column.each_with_index do |new_value, ind|
      @matrix[ind][column] = new_value
    end
  end
end
