# 24702

# Класс клетки судоку
class Cell
  attr_reader :value, :row, :column, :box, :possible_values

  # Инициализация клетки. Клетка содержит информацию о принадлежности строке, колонке и квадрату 3х3
  # значение, содержащиеся в клетке и массив возможных значений
  # @param [Integer] value значение клетки
  # @param [Integer] index порядковый номер клетки
  def initialize(value, index)
    @value = value
    @row, @column = index.divmod(9)
    @box = find_box
    @possible_values = value.zero? ? [1, 2, 3, 4, 5, 6, 7, 8, 9] : []
  end

  # Решённая ли клетка
  # @return [Boolean]
  def solved?
    !value.zero?
  end

  # Вычитание из возможных значений клетки те, которых там быть не может.
  # если останется только одно значение, клетка считается решённой
  # @param [Array] by массив значений, которых не может быть в этой клетке
  def restrict_value!(by:)
    @possible_values -= by
    if @possible_values.size == 1
      @value = @possible_values.pop
      return true
    end
    false
  end

  # Проставление значения в клетку
  # @param [Integer] value проставляемое значение
  def solve(value:)
    @possible_values = []
    @value = value
  end

  private

  # нахождение номера квадрата 3х3 по номеру строки и колонки
  # @return [Integer]
  def find_box
    column / 3 + (row / 3) * 3 # делим целочисленно, после умножения на 3 получаем 0, 1, 2 -> 0; 3, 4, 5 -> 1 и тд
  end
end

# Класс судоку
class Sudoku
  attr_reader :cells

  # Инициализация судоку
  # @param [Array<Integer>] numbers массив значенией клеток
  def initialize(numbers)
    @cells = numbers.map.with_index { |number, index| Cell.new(number, index) }
  end

  # Первые три числа судоку
  # @return [Integer]
  def first_numbers
    cells[0..2].map(&:value).join.to_i
  end

  # Решение судоку. Сначала решается алгоритмом исключений, потом - рекурсивным перебором
  def solve
    solve_by_restrictions
    return if solved? || not_solvable?
    solve_by_bruteforce
  end

  protected

  # Решён ли судоку
  # @return [Boolean]
  def solved?
    cells.all?(&:solved?)
  end

  private

  # Решение на основе исключений
  def solve_by_restrictions
    begin
      any_cell_solved = false
      # проход по клеткам и проставление на основе исключений
      cells.each do |cell|
        next if cell.solved?
        restricted_values = cells.select { |c| c.solved? && (c.row == cell.row || c.column == cell.column || c.box == cell.box) }.map(&:value).uniq
        any_cell_solved ||= cell.restrict_value!(by: restricted_values)
      end
      # проходимся по всем столбцам, строкам и квадратам, определяя значения, который могут встречаться только в одном месте
      # например в линии во всех клетках может быть по два/три значения, но одно из них - встречается только в одной клетке.
      0.upto(8) do |i|
        %i[box column row].each { |segment| any_cell_solved ||= solve_segment(index: i, segment: segment) }
      end
    end while any_cell_solved
  end

  # Решение перебором. Находится первая нерешённая клетка с несколькими доступными значениями.
  # создаются новые судоку, с проставленными на месте клетки возможными значениями
  def solve_by_bruteforce
    cell = cells.find { |cell| !cell.solved? }
    children_sudoku = Array.new(cell.possible_values.size) { deep_copy }
    children_sudoku.map.with_index do |child, ind|
      child.cells.find { |curr_cell| curr_cell.row == cell.row && curr_cell.column == cell.column }.solve(value: cell.possible_values[ind])
    end
    children_sudoku.each do |child|
      child.solve
      if child.solved?
        @cells = child.cells
        break
      end
    end
  end

  # Вывод судоку в виде таблички
  def pretty_print
    cells.each_slice(9).with_index do |row, i|
      print " ---------------------\n" if i % 3 == 0
      row.each_with_index { |cell, ind| print " #{ind % 3 == 0 ? '|' : ''}#{cell.value}" }
      print "|\n"
    end
    print " ---------------------\n"
  end

  # Решение сегмента (квадрата/строки/столбца) только на основе внутренней информации
  # @param [Integer] index индекс сегмента
  # @param [Symbol] segment тип сегмента [row/column/box]
  # @return [Boolean] проставилось что либо или нет
  def solve_segment(index:, segment:)
    result = false
    segment_cells = cells.select { |cell| !cell.solved? && cell.send(segment) == index }
    # для каждого возможного числа считаем, сколько раз встречается в possible_values.
    # Если 1 раз - значит в этой клетке и ставим это число.
    1.upto(9) do |number|
      if segment_cells.count { |cell| cell.possible_values.include?(number) } == 1
        segment_cells.find { |cell| cell.possible_values.include?(number) }.solve(value: number)
        result = true
      end
    end
    result
  end

  # Нерешаемый ли набор
  # @return [Boolean]
  def not_solvable?
    cells.any? { |cell| !cell.solved? && cell.possible_values.empty? }
  end

  # Копия текущего судоку
  # @return [Sudoku]
  def deep_copy
    Marshal.load(Marshal.dump(self))
  end
end

summa = File.read('Sudoku.txt').scan(/(?<=Grid \d\d)[\d\n]+/).sum do |sudoku_numbers|
  sudoku = Sudoku.new(sudoku_numbers.scan(/\d/).map(&:to_i))
  sudoku.solve
  sudoku.first_numbers
end
p summa
