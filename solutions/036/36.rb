# Найти сумму чисел, что в 10-м и 2-м предтавлении - палиндромы (585 = 1001001001) - 872187

p 1.step(999_999, 2).inject { |sum, num| (num.to_s == num.to_s.reverse && num.to_s(2) == num.to_s(2).reverse) ? sum + num : sum }
