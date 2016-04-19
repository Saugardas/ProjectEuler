# Найти самый большой полидром, полученный произведением 2х 3-хзначных чисел

class Integer
  def is_polyndrom?
    self.to_s == self.to_s.reverse
  end
end

poly = 0
999.downto(100) do |i|
  999.downto(i) do |j|
    ch = i*j
    break if ch < poly
    poly = ch if ch.is_polyndrom? and poly < ch
  end
end
p poly