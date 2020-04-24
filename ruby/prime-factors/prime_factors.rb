class PrimeFactors
  def self.of(int)
    factors = []
    (2..int).each do |i|
      next if int % i != 0
      factors << i
      int /= i
      redo if int % i == 0
      break if int == 1
    end

    factors
  end
end
