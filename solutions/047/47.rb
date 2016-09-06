# Найти 1 число последовательности 4х числел, имеющих в разложении на простые множители 4 множителя 134043

require 'prime'

#1.upto(500_000).each_cons(4) {|slice| p slice and break if(slice.map{|el| el.prime_division.size}.reduce(&:&) == 4) }

count = 0
1.upto(500_000_000) do |num|
  if num.prime_division.size == 4
    count += 1
  else
    count = 0
  end
  p (num - 3)..num and break if count == 4
end
