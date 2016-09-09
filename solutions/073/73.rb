# Среди списка дробей, числитель и знаменатель которых могут быть в пределах 12кб найти количество лежащих
# между 1/3 и 1/2 (7295372)
#
# перебор, выполняется ~ 41s
count = 0
2.upto(120) do |denom|
  1.upto(denom - 1) do |numer|
    count += 1 if numer.gcd(denom) == 1 && Rational(numer, denom).between?(1 / 3r, 1 / 2r)
  end
end
p count - 2 # 1/3 и 1/2 два раза посчитали
