# Найти сумма всех чисел, сумма цифр в 5й степени которых равны самому числу
# Проверяем числа в диапазоне (100, 999.999), числа >= 10^7 не могут поподать под условие (тк 7 * 9^5 << 10^7),
# возможные двухзнчные сочетания также не подходят (10,11,12,20,21,22). А остальные - тупо перебираем
p (100..999_999).inject { |sum, num| num == num.digits.sum { |i| i**5 } ? sum + num : sum } # 443839
