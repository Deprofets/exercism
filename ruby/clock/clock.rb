class Clock
  def initialize(hour: 0, minute: 0)
    @hour = (hour +  minute / 60) % 24

    @minute = minute % 60
  end

  attr_accessor :hour, :minute
  def to_s
    "#{"%02d" % @hour}:#{"%02d" % @minute}"
  end

  def +(clock)
    Clock.new(hour: @hour + clock.hour, minute: @minute + clock.minute)
  end

  def -(clock)
    Clock.new(hour: @hour - clock.hour, minute: @minute - clock.minute)
  end

  def ==(clock)
    @hour == clock.hour && @minute == clock.minute
  end
end
