# F(x) - x-ый элемент ряда Фиббоначи
# Найти, какой член последоватлеьности даёт 1000 цифп

old = new = 1
count = 2

while new.to_s.size < 1000 do
  old, new = new, old + new
  count += 1
end
p count