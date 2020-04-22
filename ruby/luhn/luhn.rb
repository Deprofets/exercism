class Luhn
  def self.valid?(str)
    return false if !(str.size > 1)
    return false if str.match?(/^\s|[^\d\s]/)

    digits = str.scan(/\d/).map(&:to_i)

    sum = 0

    digits.reverse.each_with_index { |x, i| sum += i.odd? ? (x * 2).digits.sum : x }

    sum % 10 == 0
  end
end
