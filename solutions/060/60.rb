# Найти сумму числе в наборе из 5 простых чисел, таких что каждое число с каждым при соединении
# даёт также простое число ([13, 5197, 5701, 6733, 8389] - 26033)
require 'prime'

# true если каждое число в массиве при соединении с new_prime - даёт простое число
def remarkable_set?(*array, new_prime)
  array.all? { |num| (num.to_s + new_prime.to_s).to_i.prime? && (new_prime.to_s + num.to_s).to_i.prime? }
end

primes = Prime.take(1_100)[1..-1] # 2 не нужна, тк с ней пар не получится

primes[0..-5].each_with_index do |first_prime, i1|
  primes[i1..-4].each_with_index do |second_prime, i2|
    next unless remarkable_set?(first_prime, second_prime)
    primes[(i1 + i2)..-3].each_with_index do |third_prime, i3|
      next unless remarkable_set?(first_prime, second_prime, third_prime)
      primes[(i1 + i2 + i3)..-2].each_with_index do |fourth_prime, i4|
        next unless remarkable_set?(first_prime, second_prime, third_prime, fourth_prime)
        primes[(i1 + i2 + i3 + i4)..-1].each do |fifth_prime|
          next unless remarkable_set?(first_prime, second_prime, third_prime, fourth_prime, fifth_prime)
          p [first_prime, second_prime, third_prime, fourth_prime, fifth_prime]
          p [first_prime, second_prime, third_prime, fourth_prime, fifth_prime].sum
          exit
        end
      end
    end
  end
end
