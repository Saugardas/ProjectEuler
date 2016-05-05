# Имеется файл со словами, каждому слову соответсвует число (сумма порядковых номеров букв)
# Сколько из этих слов принядлежат числам последовательности 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# читаем из файла данные
def get_names
  File.open('PE_42') do |file|
    file.read.scan(/\w+/)
  end
end

hash = ('A'..'Z').zip(1..26).to_h    # {'A' => 1, 'B' => 2...}
seq = Array.new(20){|i| (i + 1)*i/2} # последовательность для проверки

p get_names.map{|word| word.chars.inject(0){|sum, el| sum + hash[el]} }.select{|num| seq.include? num}.size