# Найти сумму простых чисел, меньших 2_000_000
require 'prime'
p Prime.take_while{ |i| i < 2_000_000 }.reduce :+


