# Найти сумму числе в 100! (648)
p (1..100).reduce(:*).to_s.chars.inject(0) { |sum, el| sum + el.to_i }
