# Найти сумму чисел, меньших 1000 и кратных 3 и 5 (233_168)
p (1...1000).reject { |el| el % 3 != 0 && el % 5 != 0 }.reduce(:+)
