# 1258

# генерирует всевозможные методы для данного набора операндов, возвращает массив лямбд
def generate_methods(meth1, meth2, meth3)
  lambdas = [->(a, b, c, d) { a.send(meth1, b).send(meth2, c).send(meth3, d) }] # (a x b) x c) x d
  # если все операнды равноприоритетны, то набор вычисляется только линейно
  return lambdas if equal_precedence?([meth1, meth2, meth3])
  lambdas << ->(a, b, c, d) { a.send(meth1, b).send(meth2, c.send(meth3, d)) } # (a x b) x (c x d)
  lambdas << ->(a, b, c, d) { a.send(meth1, b.send(meth2, c)).send(meth3, d) } # (a x (b x c)) x d
  lambdas << ->(a, b, c, d) { a.send(meth1, b.send(meth2, c).send(meth3, d)) } # a x ((b x c) x d)
  lambdas << ->(a, b, c, d) { a.send(meth1, b.send(meth2, c.send(meth3, d))) } # a x (b x (c x d))
  lambdas
end

# проверяет, одинаковый ли приоритет у набора операндов
def equal_precedence?(methods)
  (methods - %i[+ -]).empty? || (methods - %i[* /]).empty?
end

# генерирует массив всевозможных методов
def methods
  @methods ||= %i[+ - * /].repeated_permutation(3).flat_map { |meth1, meth2, meth3| generate_methods(meth1, meth2, meth3) }
end

def sequence_length(set)
  sequence = set.permutation.flat_map do |a, b, c, d|
    methods.map do |l|
      l.call(a, b, c, d)
    rescue ZeroDivisionError
      0
    end
  end
  sequence.select! { |r| r.positive? && (r % 1).zero? }
  sequence.uniq.sort.map(&:to_i).select.with_index(1) { |num, ind| num == ind }.last || 0
end

result = [*1..9].combination(4).map do |digits_set|
  [digits_set, sequence_length(digits_set.map(&:to_r))]
end

p result.max_by(&:last)
