class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    words = @str.downcase.scan(/(\w+('\w)?)/).map { |x| x[0] }
    Hash[words.uniq.map { |word| [word, words.count(word)] }]
  end
end
