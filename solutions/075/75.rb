# 161_667

MAX_PERIMETER = 1_500_000

# проходимся по троичному дереву примитивных троек (метод Берггрена)
def primitive_triples
  primitive_triples = [[3, 4, 5]] # все примитивные пифагоровы тройки являются потомками тройки (3, 4, 5)
  while primitive_triples.size.positive?
    next_generation = []
    primitive_triples.each do |triple|
      yield triple
      a, b, c = triple
      next_generation += [
          [a - 2*b + 2*c, 2*a - b + 2*c, 2*a - 2*b + 3*c],
          [a + 2*b + 2*c, 2*a + b + 2*c, 2*a + 2*b + 3*c],
          [-a + 2*b + 2*c, -2*a + b + 2*c, -2*a + 2*b + 3*c]
      ]
    end
    primitive_triples = next_generation.select { |trip| trip.sum <= MAX_PERIMETER }
  end
end

sizes = Hash.new(0)
primitive_triples do |triple|
  perimeter = triple.sum
  perimeter.step(MAX_PERIMETER, perimeter) { |w| sizes[w] += 1 }
end
p sizes.count { |_, v| v == 1 }
