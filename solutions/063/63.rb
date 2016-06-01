# Найти количество чисел, имеющий n цифр и являющихся n-ой степенью

p 1.upto(30).inject(0){|sum, power| sum + 1.upto(9).count{|num| (num**power).to_s.size == power } }