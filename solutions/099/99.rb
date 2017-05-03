# 709

logarithms = File.readlines('PE_99').map { |el| el.scan(/\d+/).reduce { |base, exp| exp.to_i * Math.log(base.to_i) } }
p logarithms.each.with_index(1).max
