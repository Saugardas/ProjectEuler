# Число чисел Лишрел, меньших 10_000 (249)

def lychrel? num
  # для чисел, меньших 10_000, хватает 25 итераций
  25.times do
    num += num.to_s.reverse.to_i
    return false if num.to_s == num.to_s.reverse
  end
  true
end

p (1..10_000).count{|i| lychrel? i}