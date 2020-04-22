class Grains
  # @param pos [Integer]
  def self.square(pos)
    raise ArgumentError if !pos.positive? || (pos > 64)
    2**(pos - 1)
  end

  def self.total
    (0...64).map { |i| 2**i }.sum
  end
end

# Calculate the number of grains of wheat on a chessboard given that the number
# on each square doubles.
#
# There are 64 squares on a chessboard.
#
# Write code that shows:
# - how many grains were on each square, and
# - the total number of grains
