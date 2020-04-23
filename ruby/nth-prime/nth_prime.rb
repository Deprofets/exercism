Infinity = 1.0 / 0

class Prime
  def self.nth(n)
    raise ArgumentError if n == 0
    primes = []
    (2..Infinity).each do |current|
      next if primes.any? { |prime| current % prime == 0 }
      primes << current
      break primes.last if primes.size >= n
    end
  end
end
