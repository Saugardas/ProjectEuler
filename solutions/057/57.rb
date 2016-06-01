# (153)
# m/n => (m+2n)/(m+n)

numer, denom = 3, 2
count = 0
1_000.times do
  count += 1 if numer.to_s.size > denom.to_s.size
  numer, denom = numer + 2*denom, numer + denom
end
p count

p (1..999).inject([[3, 2]]){|arr, _| arr << [arr.last[0] + 2*arr.last[1], arr.last[0] + arr.last[1]]}.count{|fract| fract[0].to_s.size > fract[1].to_s.size}