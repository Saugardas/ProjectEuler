# 18769

class AnagramPair
  attr_reader :word1, :word2, :size, :mapping

  def initialize(word1, word2)
    @word1 = word1.chars
    @word2 = word2.chars
    @size = word1.size
    @mapping = find_mapping(@word1, @word2)
  end

  # возвращает правило отображения символов в двух словах
  # ("CENTRE", "RECENT") => { 0=>2, 1=>1, 5=>3, 2=>4, 3=>5, 4=>0 }
  def find_mapping(word1, word2)
    indexes = ->(word, char) { word.each_index.select { |i| word[i] == char } }
    word1.uniq.flat_map do |char|
      indexes.call(word1, char).zip(indexes.call(word2, char))
    end.to_h
  end

  # соотвествует ли число слову в паре анаграм
  def accord_to_schema?(number)
    digits = number.digits.reverse
    return false if word1.size != digits.size || word1.uniq.size != digits.uniq.size
    hash = {}
    digits.each_with_index do |digit, ind|
      hash[digit] ? hash[digit] << word1[ind] : hash[digit] = [word1[ind]]
    end
    hash.transform_values!(&:uniq)
    hash.values.all? { |val| val.size == 1 }
  end

  # получаем соотвествующее число из number по mapper-правилу перестановки
  # например 12345, { 0 => 4, 1 => 1, 2 => 3, 3 => 0, 4 => 2 } => 42531
  def according_number(integer)
    digits = integer.digits.reverse
    new_number = Array.new(digits.size, 0)
    mapping.each do |k, v|
      new_number[v] = digits[k]
    end
    new_number.join.to_i
  end
end

# true, если слова являются анаграммами
def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

# загрузка анаграм, сгруппированных и отсортированных по размеру слова
def load_anagrams(words)
  anagrams = words.combination(2).map { |word1, word2| AnagramPair.new(word1, word2) if anagram?(word1, word2) }.compact
  anagrams.group_by(&:size).sort_by { |el| -el.first }
end

# возвращает список квадратов разрядностью digits_count
def find_quarters(digits_count)
  min = (10**((digits_count - 1) / 2.0)).ceil
  max = (10**(digits_count / 2.0)).floor
  (min..max).map { |el| el * el }
end

words = File.read('PE_98').scan(/\w+/)
anagrams = load_anagrams(words)

anagrams.each do |digits_count, pairs|
  quarter_pairs = []
  quarters = find_quarters(digits_count)
  pairs.each do |pair|
    quarters.each do |quarter|
      next unless pair.accord_to_schema?(quarter)
      according_number = pair.according_number(quarter)
      quarter_pairs += [quarter, according_number] if quarters.include?(according_number) && quarter != according_number
    end
  end
  p quarter_pairs and break if quarter_pairs.any?
end
