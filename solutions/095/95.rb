# 14316
require_relative '../../lib/number_theory'

def divisors_sum(number)
  NumberTheory.divisors_list(number).sum
end

@not_cycled = {}
def find_chain_size(number)
  list = [number]
  loop do
    next_number = divisors_sum(list.last)
    return list.size if next_number == number
    if @not_cycled[next_number] || next_number > 1_000_000 || list.include?(next_number)
      @not_cycled[number] = true
      return 0
    end
    list << next_number
  end
end

p 1.upto(1_000_000).map { |i| [i, find_chain_size(i)] }.max_by(&:last)
