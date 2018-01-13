# Дан текстовый файл с 5000 имён
# Надо - отсортировать
# Для каждого имени сумма очков = порядковый номер * алфавитную сумму
# Алфавитная сумма = сумма порядковых номеров букв слова (COLIN = 3+15+12+9+14 = 53)
# Найти сумму всех очков (871198282)

OFFSET = 'A'.ord - 1 # Код A должен быть 1

# читаем из файла данные
def get_names
  File.open('PE_22') do |file|
    file.read.scan(/\w+/).sort
  end
end

def get_alphabets_summ(name)
  name.chars.inject(0) { |sum, char| sum + char.ord - OFFSET }
end

p get_names.each.with_index(1).sum { |name, index| get_alphabets_summ(name) * index }
