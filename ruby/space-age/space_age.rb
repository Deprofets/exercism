PERIODS = {
  :on_earth => 31557600,
  :on_mercury => 0.2408467,
  :on_venus => 0.61519726,
  :on_mars => 1.8808158,
  :on_jupiter => 11.862615,
  :on_saturn => 29.447498,
  :on_uranus => 84.016846,
  :on_neptune => 164.79132,
}.freeze

class SpaceAge
  def initialize(age_in_seconds)
    @age = age_in_seconds
  end

  PERIODS.each_pair do |key, val|
    define_method key do
      if key == :on_earth
        (@age / val.to_f).round 2
      else
        (on_earth / val).round 2
      end
    end
  end
end

#SpaceAge.new(10**9).on_mercury
