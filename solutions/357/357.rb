# 1739023853137

require 'prime'

def all_divisor_sums_prime?(num)
  (2..Math.sqrt(num).floor).all? { |i| num % i != 0 || (num / i + i).prime? }
end

# 1 + num/1 - должно быть простое, так что проверяем предшествующие простым числам
primes = Prime.take_while { |prime| prime < 100_000_000 }
p primes.map(&:pred).select { |d| all_divisor_sums_prime?(d) }.sum
