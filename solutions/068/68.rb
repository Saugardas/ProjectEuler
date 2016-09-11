#

DIGITS = (1..6).to_a

# [a1, a2...an] -> [[a1, a2], [a2, a3]...[an, a1]]
def pairs(ring)
  ring.each_cons(2).to_a << [ring.last, ring.first]
end

# возвращаем набор - сопоставляем кольца (отсортировано по убыванию) с хвостами (отсортированными по возрастанию).
def find_set(rings, tails)
  rings = rings.sort_by { |ring| ring.reduce(:+) }.reverse
  tails = tails.sort
  tails.zip(rings).map(&:flatten)
end

# магический ли набор - сумма по всем направлениям одна
def magic?(set)
  set.map { |el| el.reduce(:+) }.uniq.one?
end

# возвращаем строку, проходимся по набору по часовой стрелке
def set_into_string(set)
  arr = set.shift
  arr += set.delete(set.detect { |e| e[1] == arr.last }) while set.any?
  arr.join
end

# находим магический набор по кольцу. Если не нашлось - nil
def find_magic_set(ring)
  tails = DIGITS - ring
  set = find_set(pairs(ring), tails)
  p set_into_string(set) if magic?(set)
end

# находим все варианты внутри кольца - перестановки за вычетом кольцевых перестановок
rings = DIGITS.permutation(3).to_a
rings.map { |ring| rings.delete(ring.rotate); rings.delete(ring.rotate(2)) }


rings.each do |ring|
  find_magic_set(ring)
end

