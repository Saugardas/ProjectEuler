# 743

p IO.readlines('PE_89').map(&:strip).sum { |roman| roman.size - roman.gsub(/VIIII|IIII|LXXXX|XXXX|DCCCC|CCCC/, '__').size }
