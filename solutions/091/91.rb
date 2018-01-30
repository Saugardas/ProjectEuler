# 14234

require 'mathn'

HALF_PI = Math::PI / 2
SIZE = 50

# является ли прямоугольным треугольник с вершинами в (0.0), point1 и point2
def right_triangle?(point1, point2)
  # три точки лежат на одной линии
  return false if (point1.first.zero? && point2.first.zero?) || (point1.last.zero? && point2.last.zero?)
  return true if point1.first.zero? && point2.last.zero? # проверка что прямой угол у начала координат
  right_angle_near?(point1, point2) || right_angle_near?(point2, point1)
end

# является ли прямым угол у точки point между second_point и началом координат
def right_angle_near?(point, second_point)
  origin_vec = -Vector[point.first, point.last] # вектор в начало координат
  second_vec = Vector[second_point.first - point.first, second_point.last - point.last] # вектор во вторую точку
  origin_vec.angle_with(second_vec).abs == HALF_PI
end

points = [*0..SIZE].product([*0..SIZE]) - [[0, 0]]
p points.combination(2).count { |point1, point2| right_triangle?(point1, point2) } # 14234
