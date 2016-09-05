# Сколькими способами можно набрать £2, используя любое количество монет? (73682)

# простой перебор, выполняетя ~ 0.03 сек
count = 1 # одной монетой
MAX = 200

0.upto(2) do |pound|
  0.upto(4) do |pence_50|
    break if pence_50 * 50 + pound * 100 > MAX
    0.upto(10) do |pence_20|
      break if pence_20 * 20 + pence_50 * 50 + pound * 100 > MAX
      0.upto(20) do |pence_10|
        break if pence_10 * 10 + pence_20 * 20 + pence_50 * 50 + pound * 100 > MAX
        0.upto(40) do |pence_5|
          break if pence_5 * 5 + pence_10 * 10 + pence_20 * 20 + pence_50 * 50 + pound * 100 > MAX
          0.upto(100) do |pence_2|
            break if pence_2 * 2 + pence_5 * 5 + pence_10 * 10 + pence_20 * 20 + pence_50 * 50 + pound * 100 > MAX
            count += 1  # остальное наберём однопесновыми монетами
          end
        end
      end
    end
  end
end
p count
