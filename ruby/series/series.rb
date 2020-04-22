class Series
  def initialize(str)
    @str = str
    @length = str.length
  end

  def slices(slice_len)
    raise ArgumentError if slice_len > @length
    @str.chars.each_cons(slice_len).to_a.map(&:join)
  end
end
