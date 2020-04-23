class RunLengthEncoding
  def self.encode(str)
    str.chars.chunk_while { |a, b| a == b }.reduce('') do |res, c|
      res << "#{(times = c.size) > 1 ? times : ''}" << c[0]
    end
  end

  def self.decode(str)
    str.gsub(/\d+\D/) { |match| match[-1] * match[0..-2].to_i }
  end
end
