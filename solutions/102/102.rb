# 228

class Point
  attr_reader :x, :y

  def initialize(x, y)
    @x = x.to_f
    @y = y.to_f
  end

  def -(other)
    Point.new(x - other.x, y - other.y)
  end

  # p = Lb + Mc
  def in_triangle?(a, b, c)
    point = self - a; b -= a; c -= a
    m = (point.x * b.y - b.x * point.y) / (c.x * b.y - b.x * c.y)
    return false unless m.between?(0, 1)
    l = (point.x - m * c.x) / b.x
    l.between?(0, 1) && (m + l) <= 1
  end
end

origin = Point.new(0, 0)
triangles = IO.readlines('PE_102').map { |line| line.chop.split(',').each_slice(2).map { |pair| Point.new(*pair) } }
p triangles.count { |a, b, c| origin.in_triangle?(a, b, c) }
