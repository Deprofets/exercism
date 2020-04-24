class ETL
  # @param dict [Hash{Integer => Array<String>}]
  def self.transform(dict)
    dict.each_with_object({}) do |(score, chars), hash|
      chars.map(&:downcase).each { |c| hash[c] = score }
    end
  end
end
