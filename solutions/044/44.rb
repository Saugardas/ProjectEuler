# Ряд пентагональных чисел - 1, 5, 12, 22... Pn=n(3n−1)/2
# Есть среди них числа, сума и разница которых - тоже пентагональные. Найти Минимальную разницу средуи таких чисел (5482660)
class Integer
  def pentagonal?
    ((24 * self + 1)**0.5).modulo(6) == 5
  end
end

pent = Array.new(3_000) { |i| (3 * i * i - i) / 2 }[1..-1]
catch :done do
  pent.each_with_index do |p1, ind|
    pent[ind..-1].each do |p2|
      p(p2 - p1) and throw(:done) if (p2 - p1).pentagonal? && (p1 + p2).pentagonal?
    end
  end
end
