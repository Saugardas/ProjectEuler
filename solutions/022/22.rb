# Дан текстовый файл с 5000 имён
# Надо - отсортировать
# Для каждого имени сумма очков = порядковый номер * алфавитную сумму
# Алфавитная сумма = сумма порядковых номеров букв слова (COLIN = 3+15+12+9+14 = 53)
# Найти сумму всех очков

OFFSET = 'A'.ord - 1 # Код A должен быть 1

# читаем из файла данные
def get_names
  File.open('PE_22') do |file|
    file.read.scan(/\w+/).sort
  end
end

def get_alphabets_summ name
  name.chars.inject(0){|sum, char| sum + char.ord - OFFSET}
end

summa = 0
get_names.each_with_index do |name, index|
  summa += get_alphabets_summ(name) * (index + 1)
end
p summa

# однострочный ужас =)
# File.open('PE_22') {|file| p file.read.scan(/\w+/).sort.each_with_index.inject(0){|sum, el| sum + el.first.chars.inject(0){|sum, char| sum + char.ord - 'A'.ord + 1} * (el.last + 1)} }