# Существует только 1 тройка Пифагора, для которой a+b+c=1000. Найти a*b*c (31875000)
catch :done do
  (1..499).each do |a|
    ((500 - a)..(999 - a)).each do |b|
      c = 1000 - a - b
        p a * b * c and throw(:done) if (a + b + c == 1000) && (a * a + b * b == c * c)
    end
  end
end
