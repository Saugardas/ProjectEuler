# How many numbers below fifty million can be expressed as the sum of a prime square, prime cube, and prime fourth power?
# (1097343)

require 'prime'
require 'set'

MAX = 50_000_000

prime_edge =  MAX**0.5 # простое число не может быть больше корня из 50млн (до 7069)

primes = Prime.take_while { |p| p < prime_edge }

numbers = Set.new  # числа должны быть уникальны
s = Time.now
primes.each do |for_sq|
  primes.each do |for_th|
    primes.each do |for_fo|
      num = for_sq**2 + for_th**3 + for_fo**4
      num < MAX ? numbers << num : break
    end
  end
end
p numbers.size