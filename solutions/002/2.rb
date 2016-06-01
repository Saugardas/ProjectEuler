# Находим сумму чётных элементов ряда Фиббоначи до 4млн

old, new, rez = 1, 2, 0
while new <= 4_000_000  do
  rez += new if new%2 == 0
  old, new = new, old + new
end
p rez


