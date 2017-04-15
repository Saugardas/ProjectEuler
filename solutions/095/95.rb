# 14316
MAX = 1_000_000

def get_divisors_sum(number)
  array = Array.new(number + 1, 0)
  1.upto(number / 2) { |i| (2 * i).step(number, i) { |j| array[j] += i } }
  array
end

@array = get_divisors_sum(MAX)
def find_chain_size(number)
  list = [number]
  loop do
    next_number = @array[list.last]
    return list.size if next_number == number
    return 0 if next_number > 1_000_000 || list.include?(next_number)
    list << next_number
  end
end

p [*1..MAX].map { |i| [i, find_chain_size(i)] }.max_by(&:last)
