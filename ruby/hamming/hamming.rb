class Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError if strand_a.size != strand_b.size
    (0...strand_a.size).to_a.reduce(0) do |diffs, i|
      diffs + (strand_b[i] == strand_a[i] ? 0 : 1)
    end
  end
end
