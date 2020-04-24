class Array
  def keep(&block)
    self.class.new(self).map { |e| yield(e) ? e : nil }.compact
  end

  def discard(&block)
    self.class.new(self).map { |e| yield(e) ? nil : e }.compact
  end
end
