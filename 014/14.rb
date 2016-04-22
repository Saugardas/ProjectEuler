# Существует последовательность чисел
# Если число чётное - число делится на два (n/2)
# Если не чётное - умножается на 3 и прибавляется единица (3n+1)
# Такие последовательности сходятся к единице, хоть это и не доказано
# Найти число, < 1_000_000, имеющее максимальное число промежуточных чисел перед получением единицы

$xesh = {2 => 1}

def find_length num
  # возвращаем число промежуточных чисел до первращения в 1
  local_num = num
  count = 0
  while local_num > 1 do
    local_num = local_num.even? ? local_num/2 : local_num*3 + 1
    count += 1
    if $xesh.key?(local_num)
      $xesh[num] = count + $xesh[local_num]
      return count + $xesh[local_num]
    end
  end
  count
end

number, wey = 2, 1
3.upto(1_000_000) do |i|
  r = find_length i
  if r > wey
    wey = r
    number = i
  end
end
p number