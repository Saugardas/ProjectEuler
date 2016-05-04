# Найти самое большое панцифровое число

require 'prime'

9.downto(2) do |i|
  next if ((1..i).reduce(:+) % 3).zero?  # # 1..9 и 1..8 панцифровые числа не могут быть простыми, ибо деляться на 3
  arr = []
  (1..i).to_a.permutation.each do |perm|
    arr << perm.join.to_i if perm.join.to_i.prime?
  end
  p arr.max and break if arr.any?
end

# однострочно
p (1..7).to_a.permutation.map{|perm| perm.join.to_i}.select(&:prime?).max
