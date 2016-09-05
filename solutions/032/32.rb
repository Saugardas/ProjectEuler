# Начйти сумму чисел, в для которых формула а + б = с имеет в совём составе все цифры от 1 до 9 один раз (45228)

# число - рещультат произведения может быть только 4-значным, те если число больше - мы не можем его получить маленькими множителями
# если число меньше - то множители становятся слишком большие
# проверям a * bbbb = cccc и aa * bbb = cccc

arr = []
(1..9).to_a.permutation do |perm|
  arr << perm[5..-1].join.to_i if perm[0] * perm[1..4].join.to_i == perm[5..-1].join.to_i || perm[0..1].join.to_i * perm[2..4].join.to_i == perm[5..-1].join.to_i
end
p arr.uniq.reduce :+

# однострочно
#p (1..9).to_a.permutation.map{|perm| perm[5..-1].join.to_i if perm[0]*perm[1..4].join.to_i == perm[5..-1].join.to_i || perm[0..1].join.to_i*perm[2..4].join.to_i == perm[5..-1].join.to_i}.compact.uniq.reduce :+
