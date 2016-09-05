# Найти сумму 11 простых чисел, что при отсекании цифр и слева и справа остаются простыми

require 'prime'

primes = []
Prime.each do |prime|
  next if prime < 10
  digits = prime.to_s.chars
  next if (digits & %w(0 4 6 8)).any? # если останутся при обрезании чётные - значит не простое
  left_truncate = Array.new(digits.size) { |i| digits[i..-1].join.to_i }
  right_truncate = Array.new(digits.size) { |i| digits[0..i].join.to_i }
  primes << prime if left_truncate.all?(&:prime?) && right_truncate.all?(&:prime?)
  break if primes.size == 11
end

p primes.reduce :+ # 748317
