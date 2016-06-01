# Число уникальных цифр в наборе a^b, где a - 2..100 и b - 2..100

array = []
2.upto(100) do |i|
  2.upto(100) do |j|
    array << i**j
  end
end
p array.uniq.size