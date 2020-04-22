DAYS_GIFTS = {
  "first" => "a Partridge",
  "second" => "two Turtle Doves, and ",
  "third" => "three French Hens, ",
  "fourth" => "four Calling Birds, ",
  "fifth" => "five Gold Rings, ",
  "sixth" => "six Geese-a-Laying, ",
  "seventh" => "seven Swans-a-Swimming, ",
  "eighth" => "eight Maids-a-Milking, ",
  "ninth" => "nine Ladies Dancing, ",
  "tenth" => "ten Lords-a-Leaping, ",
  "eleventh" => "eleven Pipers Piping, ",
  "twelfth" => "twelve Drummers Drumming, ",
}.freeze

class TwelveDays

  def self.song
    song = []
    gifts = ''

    DAYS_GIFTS.each_pair do |day, item|
      gifts = item << gifts
      song << "On the #{day} day of Christmas my true love gave to me: #{gifts} in a Pear Tree."
    end
    
    song.join("\n\n") << "\n"
  end
end
