# Дана матрица 80 на 80, можно идти вниз и вправо. Найти путь с минимальной суммой
# 427337

matrix = File.open('PE_81').each_line.map { |line| line.scan(/\d+/).map(&:to_i) }

# по диагоналям
1.upto(matrix.size * 2 - 2) do |diag|
  (diag + 1).times do |y|
    x = diag - y # [5, 0], [4, 1], [3, 2], [2, 3], [1, 4], [0, 5]
    next if x >= matrix.size || y >= matrix.size # вышли за границы матрицы
    matrix[x][y] +=
      if x.zero?
        matrix[x][y - 1]
      elsif y.zero?
        matrix[x - 1][y]
      else
        [matrix[x - 1][y], matrix[x][y - 1]].min
      end
  end
end

p matrix.last.last
