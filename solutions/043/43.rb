# Панцифровое число 1406357289 - иммет свойство: d2d3d4=406 делится 2, d3d4d5=063 - делится на три и тд
# Найти сумму всех панцифроаввых чисел с таким свойством (16695334890)

def correct(number)
  [2, 3, 5, 7, 11, 13, 17].each_with_index do |div, index|
    return false unless (number[index + 1, 3].to_i % div).zero?
  end
  true
end

p ('0'..'9').to_a.permutation.select { |perm| correct(perm.join) }.sum { |el| el.join.to_i }
