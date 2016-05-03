 # Число d - 0,1234567891011121314151617181920....
 # d(12) - двенадцатая цифра - есть 1
 # Найти d(1)*d(10)*d(100)*d(1_000)*...*d(1_000_000)

number = '0'
1.upto(1_000_000) do |i|
  number << i.to_s
  break if number.size > 1_000_000
end
mult = 1
7.times {|i| mult *= number[10**i].to_i }
p mult