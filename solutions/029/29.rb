# Число уникальных чисел в наборе a^b, где a - 2..100 и b - 2..100 (9183)

p [*2..100].repeated_permutation(2).map { |x| x.reduce(:**) }.uniq.size
