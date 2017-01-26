# 402

# массив факториалов, чтобы каждый раз не высчитывать
@factorial = [1] + (1..9).map { |n| (1..n).reduce(:*) }

# сумма факториалов цифр 169 = 1! + 6! + 9! = 363_601
@cache = {}
def factorial_sum(number)
  @cache[number] || @cache[number] = number.digits.map { |num| @factorial[num] }.reduce(:+)
end

count = 0
2.upto(999_999) do |num|
  numbers = [num]
  loop do
    fact_sum = factorial_sum(numbers.last)
    break if numbers.include? fact_sum
    numbers << fact_sum
  end
  count += 1 if numbers.count == 60
end
p count
