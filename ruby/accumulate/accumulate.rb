class Array
  def accumulate(&block)
    reduce([]) { |arr, x| arr << yield(x) }
  end
end
