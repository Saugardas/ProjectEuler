# 71
require 'prime'

MAX = 5_000
@primes = Prime.take_while { |prime| prime <= 100 }
@cache = {}

def prime_partitions_count(sum, max)
  count = 0
  @primes.each do |prime|
    break if prime > max
    next_sum = sum - prime
    if next_sum.positive?
      next_max = (next_sum > prime) ? prime : next_sum
      count += @cache[[next_sum, next_max]] ||= prime_partitions_count(next_sum, next_max)
    else
      count += 1 if next_sum.zero?
      break
    end
  end
  count
end

2.upto 100 do |number|
  p number and break if prime_partitions_count(number, number) > MAX
end
