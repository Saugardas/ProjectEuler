# Найти самый маленький куб, переставновка цифр в котором даёт ещё 4 куба
# 127035954683 ([5027, 7061, 7202, 8288, 8384])

# находим диапазон чисел, которые при вовзедении в куб - дают dig_count цифр в числе
def range_for dig_count
  (('1' + '0'*(dig_count - 1)).to_i**(1r/3)).ceil..(('9'*dig_count).to_i**(1r/3)).floor
end

8.upto(50) do |dig_count|
  cube_hash = Hash.new([]) # для каждого набора цифр - количество чисел, образующих этот набор
  range_for(dig_count).each do |num|
    # по цифрам сортируем
    cube_hash[(num**3).to_s.chars.sort.join] += [num]
  end
  if cube_hash.select!{|_, value| value.size > 4}.any?
    p cube_hash.first
    p cube_hash.first[-1][0]**3 and break
  end
end