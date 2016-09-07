# Дан текст, зашифрованный 3-х буквенным ключем в нижнем регистре. Найти сумму кодов символов расшифрованого текста(107359)

encrypted_text = IO.read('PE_59').scan(/\d+/).map(&:to_i)

# [a1, a2, a3] ^ "s1s2s3" -> "a1^s1.ord..a3^s3.ord"
def xor(codes, string)
  Array.new([codes.size, string.size].min) { |i| codes[i] ^ string[i].ord }.map(&:chr).join
end

# перебираем все наборы ключей от aaa до zzz
('aaa'..'zzz').each do |key|
  # применяем ключ к коду
  str = encrypted_text.each_slice(3).map { |cons| xor(cons, key) }.join
  # проверям получившуюся расшифровку
  if str =~ / the /  # лучше ^[A-Za-z\d\s,\.\(\)';!]+$
    p str
    p str.chars.map(&:ord).reduce(:+)
    break
  end
end
