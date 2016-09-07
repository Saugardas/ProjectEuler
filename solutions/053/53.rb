# Число сочетаний r из n где n <= 100. Найти количество таких сочетаний, больших миллиона (4075)

# n! / r!(n−r)!
def c(n, r)
  (1..n).reduce(:*) / ((1..r).reduce(:*) * (1..(n - r)).reduce(:*))
end

count = 0
100.downto 2 do |n|
  (n - 1).downto 2 do |r|
    count += 1 if c(n, r) > 1_000_000
  end
end
p count

# one-liner
# p (2..100).inject([]){|arr, n| arr + (1..(n-1)).map {|r| (1..n).reduce(:*)/((1..r).reduce(:*)*(1..(n - r)).reduce(:*)) } }.count{|i| i > 1_000_000}
