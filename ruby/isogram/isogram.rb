class Isogram
  def self.isogram? str
    isogramchars= str.downcase.scan(/\w/)
    isogramchars.uniq.size == isogramchars.size
  end
end
