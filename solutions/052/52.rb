# Найти число, которое при умножении на 2, 3, 4, 5, 6 даёт один и тот же набор цифр (142857)
heads = '10'..'16' # 16*6 - не переходим в следующий разряд, 17*6 - переходим
DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

# num*2. num*3, num*4, num*5, num*6 - одинаковый набор цифр
def correct?(num)
  (2..6).map { |i| (i * num).to_s.chars.sort }.uniq.size == 1
end

catch :done do
  # i - число цифр в хвосте
  1.upto(10) do |i|
    heads.each do |head|
      DIGITS.permutation(i).each do |tail|
        p (head + tail.join) and throw(:done) if correct? (head + tail.join).to_i
      end
    end
  end
end
