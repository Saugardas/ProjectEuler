# сумма букв в словесном представлении чисел на англ яз (21124)

$X = {
    '1' => 3, '2' => 3, '3' => 5, '4' => 4, '5' => 4, '6' => 3, '7' => 5, '8' => 5, '9' => 4, '10' => 3, '11' => 6,
    '12' => 6, '13' => 8, '14' => 8, '15' => 7, '16' => 7, '17' => 9, '18' => 8, '19' => 8,
    '20' => 6, '30' => 6, '40' => 5, '50' => 5, '60' => 5, '70' => 7, '80' => 6, '90' => 6,
    '100' => 7, 'and' => 3, '1000' => 11, nil => 0, '0' => 0
}

def find_count_of_letters number
  return $X['1000'] if number == 1000
  ret = 0
  sot, des, ed = number.to_s[-3], number.to_s[-2], number.to_s[-1]
  ret = $X[sot] + $X['100'] if sot
  if des and des + ed == '00'
    return ret
  elsif des == '0'
    return ret + $X[ed] + $X['and']
  else
    return ret + $X[ed] unless des
    ret += $X['and'] if sot
    return ret + $X[(number%100).to_s] if des == '1'
    ret + $X[des+'0'] + $X[ed]
  end
end

p (1..1000).inject(0){|sum, i| sum + find_count_of_letters(i)}