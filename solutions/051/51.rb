# (121313)
require 'prime'

# num - число в строковом представлении, count - число заменяемых символов
# 56003, 2 => [**003, 5**03, 56**3, *6*03, *60*3, 5*0*3] - последнюю цифру не заменяем
def get_templates(num, count)
  templates = ['*'] * count + ['1'] * (num.size - count - 1)
  templates = templates.permutation.to_a.uniq
  templates.map do |temp|
    str = ''
    temp.each_with_index do |sym, index|
      sym == '*' ? str << '*' : str << num[index]
    end
    str << num[-1]
  end
end

# земеняем шаблон со звёздочками на числа
# 5**2 => 5002, 5112 и тд, но если звёздочка в шаблоне первая, то на 0 не заменяем (*5*6 => 1516, 2526..)
def replace(templates)
  templates.map do |temp|
    ((temp[0] == '*' ? '1' : '0')..'9').map { |num| temp.gsub('*', num).to_i }
  end
end

catch :done do
  Prime.each(1_000_000).each do |prime|
    next if prime < 100
    prime = prime.to_s
    1.upto(prime.size - 1) do |i|
      temps = get_templates prime, i
      sets = replace temps
      sets.each do |set|
        set.select!(&:prime?)
        p set and throw(:done) if set.count > 7
      end
    end
  end
end
