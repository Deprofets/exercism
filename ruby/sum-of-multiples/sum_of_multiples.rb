class SumOfMultiples
  def initialize(*nums)
    @nums = nums
  end

  def to(int)
    return 0 if @nums.empty? || @nums.min == 0
    multiples = []

    @nums.min.upto(int - 1) do |i|
      if @nums.any? { |num| i % num == 0 } && !multiples.include?(i)
        multiples << i
      end
    end

    multiples.sum
  end
end
