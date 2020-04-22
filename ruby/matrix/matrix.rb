class Matrix
  def initialize(str)
    matrix = str.split("\n").map { |row| row.split.map(&:to_i) }
    @rows = matrix
    @columns = matrix.transpose
  end
  attr_reader :rows, :columns
end
