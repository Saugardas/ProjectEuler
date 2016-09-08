# Найти сумму набора из 6 числе, таких что они - образует цепочку (две последние цифры 1го ичсла -
# две первые цифры последнего) и каждое из чисел является 3, 4, 5, 6, 7, 8-угольным числом
# [1281, 8128, 2882, 8256, 5625, 2512]; 28684

# true, если 2е число - продолжение 1го
def continue?(num1, num2)
  num1.to_s[2..-1] == num2.to_s[0..1]
end

octag = Array.new(100) { |i| i * (3 * i - 2) }.select { |num| num.between?(1010, 9999) && num.to_s[2] != '0' }
hash = { 3 => Array.new(200) { |i| i * (i + 1) / 2 }.select { |num| num.between?(1010, 9999) && num.to_s[2] != '0' },
         4 => Array.new(100) { |i| i * i }.select { |num| num.between?(1010, 9999) && num.to_s[2] != '0' },
         5 => Array.new(100) { |i| i * (3 * i - 1) / 2 }.select { |num| num.between?(1010, 9999) && num.to_s[2] != '0' },
         6 => Array.new(100) { |i| i * (2 * i - 1) }.select { |num| num.between?(1010, 9999) && num.to_s[2] != '0' },
         7 => Array.new(100) { |i| i * (5 * i - 3) / 2 }.select { |num| num.between?(1010, 9999) && num.to_s[2] != '0' } }

# берём 8-уголные числа, и перебираем возможные комбинации
octag.each do |oct|
  (3..7).to_a.permutation.each do |perm|
    hash[perm[0]].each do |h1|
      next unless continue?(oct, h1)
      hash[perm[1]].each do |h2|
        next unless continue?(h1, h2)
        hash[perm[2]].each do |h3|
          next unless continue?(h2, h3)
          hash[perm[3]].each do |h4|
            next unless continue?(h3, h4)
            hash[perm[4]].each do |h5|
              next unless continue?(h4, h5) && continue?(h5, oct)
              p [oct, h1, h2, h3, h4, h5]
              p [oct, h1, h2, h3, h4, h5].reduce(:+)
            end
          end
        end
      end
    end
  end
end
