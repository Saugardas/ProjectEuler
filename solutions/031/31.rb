# Сколькими способами можно набрать £2, используя любое количество монет? (73682)

def coins_count(value, coins)
  return 1 if value.zero? || (coins.size == 1 && value % coins.last == 0)
  return 0 if coins.size.zero?

  (0..value/coins.last).sum { |i| coins_count(value - coins.last * i, coins[0..-2]) }
end

p coins_count(200, [1, 2, 5, 10, 20, 50, 100, 200])
