# Есть числа (4-значные), при добавлении 3330 образующие тройку, которая является простой и является перестановкой
# 1487, 4817, 8147 - парвая пара. Найти конкатенацию второй (296962999629)
require 'prime'

STEP = 3330
def sequence(number)
  [number, number + STEP, number + 2 * STEP]
end

def correct?(seq)
  seq.all?(&:prime?) and seq.map { |num| num.to_s.chars.sort }.uniq.size == 1
end

1000.upto(10_000 - 2 * STEP) do |i|
  seq = sequence i
  p seq.map(&:to_s).sum('') if correct?(seq)
end
