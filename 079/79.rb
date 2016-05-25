# Имеется парль неизвестной длины. Есть набор из 50 цифр - части этого пароля (1я, 3я и 6я например). Найти наименьшую длину пароля, удовлетворяющую набору (73162890)

@keys = %w(319 680 180 690 129 620 762 689 762 318 368 710 720 710 629 168 160 689 716 731 736 729 316 729 729 710 769 290 719 680 318 389 162 289 162 718 729 319 790 680 890 362 319 760 316 729 380 319 728 716)
digits = [1, 2, 3, 6, 7, 8, 9, 0] # 4 и 5 нет

# =======================================================================
# перебор - перебираем все перестановки чисел, проверяя их соответствие условию

def correct? string
  @keys.all?{|k| string =~ /\d*#{k[0]}\d*#{k[1]}\d*#{k[2]}\d*/ }
end

6.upto(10) do |dig_count|
  digits.to_a.permutation(dig_count).each do |pass|
    p pass.join and break if correct?(pass.join)
  end
end

# =======================================================================
# для каждого числа пишем множество чисел, располагающихся перед ним
# после - составляем по порядку число
# работает если нет повторяющихся цифр в пароле

require 'set'
hash = {}
digits.each {|i| hash[i.to_s] = Set.new}

@keys.each do |key|
  hash[key[1]] << key[0]
  hash[key[2]] << key[0] << key[1]
end
p hash.sort_by{|_, value| value.size}.map(&:first).join