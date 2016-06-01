# Посчитать количесто воскресений, выпадающих на первое число каждого месяца
# с 1 янв 1901г по 31 дек 2000г

require 'date'
date1 = Date.new(1901, 1, 1)
date2 = Date.new(2000, 12, 31)
count = 0
while date1 < date2 do
  count += 1 if date1.sunday?
  date1 = date1.next_month
end
p count