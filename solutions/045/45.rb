# Tr = n(n+1)/2  = 1, 3, 5, 10, 15
# Pn = n(3n-1)/2 = 1, 5, 12, 22, 35
# Hx = n(2n-1)   = 1, 6, 15, 28, 45
# Tr(285)=Pn(165)=Hx(143)=40755
# Найти следуещее число, явл одновременно Tr, Pn, Hx (1533776805)

class Integer
  def pentagonal?
    ((24 * self + 1)**0.5).modulo(6) == 5
  end
end

def hexagonal
  number = 1
  loop do
    yield number * (2 * number - 1)
    number += 1
  end
end

hexagonal do |i|
  p i and break if i > 40_755 && i.pentagonal?
end

# a(n+1) = 18817*a(n) + 1568 + 1358*(192*a(n)^2 + 32*a(n) + 1)^0.5
# Последовательность A046180
p 18_817 * 40_755 + 1_568 + 1_358 * (192 * 40_755**2 + 32 * 40_755 + 1)**0.5
