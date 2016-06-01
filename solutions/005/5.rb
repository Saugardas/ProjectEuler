# Какое самое маленькое число, что делиться без остатка на все число от 1 до 20?
MAX = 20

# используя НОК
p (1..MAX).reduce :lcm

# самописное
def list_of_prime_numbers max
  return [] if max < 1
  mass = (0..max).to_a
  pred = Math.sqrt(max)
  2.upto(pred) do |x|
    unless mass[x].nil?
      (x*x).step(max, x) {|i| mass[i]=nil}
    end
  end
  mass.compact[2..-1]  # удаляем 0 и 1
end

list = list_of_prime_numbers(MAX).map do |i|
  rez = i
  rez*=i while rez < MAX/i
  rez
end

p list.reduce(:*)  # [16, 9, 5, 7, 11, 13, 17, 19]