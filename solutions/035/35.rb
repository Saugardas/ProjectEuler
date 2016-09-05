# круговое простое число - число, при ротации цифр остающееся простым (197, 971, 791)
# Как много круговых простых чисел, меньших миллиона? (55)

require 'prime'

primes = Prime.each(999_997).to_a

primes.map! do |prime|
  digits = prime.to_s.chars
  next if (digits & %w(0 2 4 6 8)).any?
  # получаем оставшиеся перестановки '1', '3', '5' => [351, 513]
  per = Array.new(digits.size - 1) { digits.rotate!.join.to_i }
  per.all? { |el| primes.include? el } ? prime : nil
end
p primes.compact.size + 1 # 2 пропущено
