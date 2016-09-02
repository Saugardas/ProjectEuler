# Найти самый большой полидром, полученный произведением 2х 3-хзначных чисел (906_609)

class Integer
  def polyndrom?
    to_s == to_s.reverse
  end
end

poly = 0
999.downto(100) do |i|
  999.downto(i) do |j|
    ch = i * j
    break if ch < poly
    poly = ch if ch.polyndrom? && poly < ch
  end
end
p poly
