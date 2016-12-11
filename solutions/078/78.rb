# 55_374

# центрированные пятиугольные числа
def generalized_pentagonal(max)
  n = 1
  loop do
    result = (3 * n**2 - n)/2
    break if result > max
    yield result, n
    result = (3 * n**2 + n)/2
    break if result > max
    yield result, n
    n += 1
  end
end

# чередуем каждые 2 элемента
def sign(number)
  number.odd? ? :+ : :-
end

# p(n) = p(n - 1) + p(n - 2) - p(n - 5) - p(n - 7) ...
@part = { 0 => 1, 1 => 1 }
def partition(number)
  return @part[number] if @part.key?(number)
  result = 0
  generalized_pentagonal(number) do |pentag, index|
    result = result.send(sign(index), partition(number - pentag))
  end
  @part[number] = result # записываем в хеш, чтобы не высчитывать повторно
  result
end

2.upto(90_000) do |number|
  result = partition(number)
  p "#{number}: #{result}" and break if (result % 1_000_000).zero?
end
