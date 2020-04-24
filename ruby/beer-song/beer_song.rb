class BeerSong
  def self.recite(start, verses)
    gen = lambda do |n|
      "#{n == 0 ? "no more" : n} bottle#{n == 1 ? '' : 's'} of beer"
    end

    verse = <<~TEXT
    %s on the wall, %s.
    %s, %s on the wall.
    TEXT

    Array.new(verses) do |i|
      current_verse = (start - i) % 100
      ending = "Take #{current_verse != 1 ? "one" : "it"} down and pass it around"
      ending = "Go to the store and buy some more" if current_verse == 0
      sprintf(verse,
              gen[current_verse].capitalize,
              gen[current_verse],
              ending,
              gen[(start - i - 1) % 100],)
    end.join("\n")
  end
end

#      1 bottle of beer on the wall, 1 bottle of beer.
#     Take it down and pass it around, no more bottles of beer on the wall.
#
#     No more bottles of beer on the wall, no more bottles of beer.
#     Go to the store and buy some more, 99 bottles of beer on the wall.
