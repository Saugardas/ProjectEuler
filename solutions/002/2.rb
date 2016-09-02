# Находим сумму чётных элементов ряда Фиббоначи до 4млн (4_613_732)

old, new, rez = 1, 2, 0
while new <= 4_000_000
  rez += new if new.even?
  old, new = new, old + new
end
p rez
