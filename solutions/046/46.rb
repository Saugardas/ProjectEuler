# Найти такое нечётное составное число, что не может быть выражено как сумму простого и удвоенного квадрата (5777)

require 'prime'
@squares = Array.new(10_000) { |i| 2 * i * i }[1..-1]

# false - если число можно представить как сумму удвоенного квадрата и протого числа, true иначе
def correct?(num)
  @squares.each do |sq|
    return false if (num - sq).prime?
  end
  true
end

9.step(100_000, 2) do |odd|
  next if odd.prime?
  p odd and break if correct?(odd)
end
