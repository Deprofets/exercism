class ArmstrongNumbers
  def self.include?(num)
    num == num.digits.map { |x| x**num.digits.size }.sum
  end
end

# Is a number that is the sum of its own digits each raised to the power of the number of digits.
