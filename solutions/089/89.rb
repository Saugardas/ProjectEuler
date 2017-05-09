# 743

def normalization(roman)
  roman.sub('VIIII', 'IX').sub('IIII', 'IV').sub('LXXXX', 'XC').sub('XXXX', 'XL').sub('DCCCC', 'CM').sub('CCCC', 'CD')
end

numbers = IO.readlines('PE_89').map(&:strip)
p numbers.sum { |roman| roman.size - normalization(roman).size }
