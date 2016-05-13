# Считаем покерные раздачи из файла, надо посчитать, сколько раз первый игрок выигрывает (379)

class HandDealt
  CARDS = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'T' => 10, 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}

  # типы наборов
  HIGH_CARD = 1
  ONE_PAIR = 2
  TWO_PAIRS = 3
  THREE_OF_KIND = 4
  STRAIGHT = 5
  FLUSH = 6
  FULL_HOUSE = 7
  FOUR_OF_A_KIND = 8
  STRAIGHT_FLUSH = 9 # royal flush also

  attr_reader :rank
  attr_reader :first, :second, :third  # карты первого набора, второго и третьего (если две пары - смотрим по first, потом по second, потом по оставшейся карте third)

  def initialize cards
    # разделяем на масти и значения
    cards, suits = cards.map(&:chars).transpose
    cards.map!{|c| CARDS[c]}.sort!.reverse!
    same_suit = suits.uniq.size == 1
    # определяем тип набора
    # если нет повторов
    if cards.uniq.size == cards.size
      # последовательность
      if cards.first - cards.last == 4
        @rank = same_suit ? STRAIGHT_FLUSH : STRAIGHT
      else # разные карты и не последовательность
        @rank = same_suit ? FLUSH : HIGH_CARD
      end
      @first = cards.first # остальные не нужно будет проверять
    else # считаем повторы
      hash = cards.each_with_object(Hash.new(0)) { |card, counts| counts[card] += 1 }
      if hash.has_value?(4)
        @rank = FOUR_OF_A_KIND
        @first = hash.key(4)
        @second = hash.key(1)
      elsif hash.has_value?(3)
        @first = hash.key(3)
        if hash.has_value?(2)
          @rank = FULL_HOUSE
          @second = hash.key(2)
          @third = hash.key(1)
        else
          @rank = THREE_OF_KIND
          @second = hash.key(1)
        end
      elsif hash.has_value?(2)
        @first = hash.key(2)
        if hash.size == 3 # значит ещё пара
          @rank = TWO_PAIRS
          @third = hash.key(1)
          @second = (hash.keys - [@first, @third]).first
        else
          @rank = ONE_PAIR
          @second = hash.key(1)
        end
      end
    end
  end

  def > other
    if rank == other.rank
      if first == other.first
        second == other.second ? third > other.third : second > other.second
      else
        first > other.first
      end
    else
      rank > other.rank
    end
  end
end

# читаем из файла данные
def hands_dealts
  File.open('PE_54') do |file|
    file.each_line {|line| yield line.chop.split(" ")}
  end
end

count = 0
hands_dealts do |h_d|
  count += 1 if HandDealt.new(h_d[0..4]) > HandDealt.new(h_d[5..9])
end
p count

# используя гем
require 'ruby-poker'
count = 0
hands_dealts do |h_d|
  count += 1 if PokerHand.new(h_d[0..4]) >  PokerHand.new(h_d[5..9])
end
p count