SCORES = {
  ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'] => 1,
  ['D', 'G'] => 2,
  ['B', 'C', 'M', 'P'] => 3,
  ['F', 'H', 'V', 'W', 'Y'] => 4,
  ['K'] => 5,
  ['J', 'X'] => 8,
  ['Q', 'Z'] => 10,
}.freeze

class Scrabble
  def initialize(str)
    @str = str
  end

  def score
    self.class.score @str
  end

  def self.score(str)
    str = str.nil? ? "" : str.upcase
    chars = str.chars.uniq
    chars.reduce(0) do |score, c|
      score + str.count(c) * SCORES.fetch(SCORES.keys.find { |_chars| _chars.include?(c) }, 0)
    end
  end
end
