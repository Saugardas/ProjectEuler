# 329468

@log_phi = Math.log10((1 + Math.sqrt(5)) / 2)
@log_sqrt = Math.log10(Math.sqrt(5))

def first_digits_pandigital?(number)
  # nth number = phi^n / sqrt(5) -> lg(nth) = n*lg(phi) - lg(sqrt(5))
  logarithm = number * @log_phi - @log_sqrt
  return false if logarithm < 8  # в числе меньше 9 цифр
  str = (10**(logarithm % 1)).to_s.sub('.', '')[0, 9] # первые 9 цифр
  pandigital?(str.to_i)
end

def pandigital?(number)
  ([1, 2, 3, 4, 5, 6, 7, 8, 9] - number.digits).empty?
end

# последовательность Фибоначчи, обрезаем последними 9 цифрами
fibonacci_tails = Enumerator.new do |yielder|
  a, b = 0, 1
  loop do
    yielder << a
    a, b = b, (a + b) % 1_000_000_000
  end
end

p fibonacci_tails.find_index.with_index { |f, ind| pandigital?(f) && first_digits_pandigital?(ind) }
