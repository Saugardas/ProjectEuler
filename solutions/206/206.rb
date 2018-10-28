# 1389019170

min = (Math.sqrt(1020304050607080900) / 10).ceil * 10
max = (Math.sqrt(1929394959697989990) / 10).floor * 10

p min.step(max, 10).find { |num| (num * num).to_s =~ /^1.2.3.4.5.6.7.8.9.0$/ }

