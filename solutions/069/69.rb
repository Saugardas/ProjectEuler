# (510510)

p 2 * 3 * 5 * 7 * 11 * 13 * 17

require_relative '../../extension'
p (2..1_000_000).map { |i| i / i.phi }.each_with_index.max
