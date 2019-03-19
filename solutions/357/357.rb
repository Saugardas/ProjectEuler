# 1739023853137

require 'prime'

def all_divisor_sums_prime?(num)
  return false unless num.succ.prime?
  (2..Math.sqrt(num).floor).each do |i|
    return false if (num % i).zero? && !(num / i + i).prime?
  end
  true
end

# Нечётные числа не проверяем, у них 1 + num/1 - чётное число, так что не подходят все кроме 1
# Кратные 4 тоже пропускаем, тк 2 + num/2 - чётное
p 1 + 2.step(100_000_000, 4).select { |d| all_divisor_sums_prime?(d) }.sum
