# F(x) - x-ый элемент ряда Фиббоначи
# Найти, какой член последоватлеьности даёт 1000 цифр (4782)

old = new = 1
count = 2

while new.to_s.size < 1000
  old, new = new, old + new
  count += 1
end
p count
