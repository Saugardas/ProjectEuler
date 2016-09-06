# Найти простое число, меньше 1млн, которе является суммой наибольшей последовательности простых чисел (997651)
require 'prime'

def serial_combination(mass)
  Array.new(mass.size) { |i| mass.each_cons(i + 1).to_a }.flatten(1)
end

primes = Prime.each(4_000).to_a
p serial_combination(primes).map { |sub_arr| [sub_arr.count, sub_arr.reduce(:+)] }.
      select { |el| el.last < 1_000_000 and el.last.prime? }.sort_by(&:first).last
