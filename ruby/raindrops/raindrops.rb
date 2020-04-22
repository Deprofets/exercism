class Raindrops
  def self.convert(int)
    sound = ""
    [
      [3, 'Pling'],
      [5, 'Plang'],
      [7, 'Plong'],
    ].each { |factor, tune| sound << tune if int % factor == 0 }
    sound.empty? ? int.to_s : sound
  end
end
