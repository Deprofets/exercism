require 'prime'

class Sieve
  def initialize(num)
    @primes = Prime.each(num).to_a
  end
  attr_accessor :primes
end
