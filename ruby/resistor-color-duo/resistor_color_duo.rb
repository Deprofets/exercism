class ResistorColorDuo
  def self.value(colors)
    values = "Black - Brown - Red - Orange - Yellow - Green - Blue - Violet - Grey - White"
    values = values.downcase.split(' - ')
    colors[0..1].reduce("") { |sum, color| sum << values.index(color).to_s }.to_i
  end
end
