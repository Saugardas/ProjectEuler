require 'mathn'

# получаем "сокращённую" дробь, иначе nil (49, 98 -> 4/8)
def cancelling(num, den)
  num = num.to_s.chars
  den = den.to_s.chars
  commons = num & den  # общая часть, иногда их две (12/21)
  return if commons.empty? || commons.size == 2 # если их две - то при любом сокращении получим 1
  num = num.join.sub(*commons, '')
  den = den.join.sub(*commons, '')
  num.to_i / den.to_i
end

fraction = Rational 1
10.upto 98 do |numenator|
  next if (numenator % 10).zero?
  (numenator + 1).upto 99 do |denominator|
    next if (denominator % 10).zero?
    fraction *= numenator / denominator if numenator / denominator == cancelling(numenator, denominator)
  end
end
p fraction.denominator  # 100
