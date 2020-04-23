Romans = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000,
}.freeze
Replacements = {
  "DCCCC" => "CM",
  "CCCC" => "CD",
  "LXXXX" => "XC",
  "XXXX" => "XL",
  "VIIII" => "IX",
  "IIII" => "IV",
}.freeze

class Integer
  def to_roman
    val = self
    Romans.sort_by { |k, v| -v }.reduce("") do |str, (roman, value)|
      str << roman * (val / value)
      val %= value
      str
    end.gsub(/DC{4}|C{4}|LX{4}|X{4}|VI{4}|I{4}/, Replacements)
  end
end
