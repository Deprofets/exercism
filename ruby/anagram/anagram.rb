class Anagram
  def initialize(word)
    @word = word.upcase
  end

  def match(str_arr)
    chars = ->(word) { Hash[word.chars.uniq.map { |c| [c, word.count(c)] }] }
    word_chars = chars[@word]
    str_arr.select { |word| word.upcase != @word && chars[word.upcase] == word_chars }
  end
end
