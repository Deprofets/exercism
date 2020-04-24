class Frame
  def initialize(state: nil, pos: nil, id: 1)
    @id = id
    @state = state
    @pos = pos
  end
  attr_accessor :state, :pos, :id

  def get_end_pos
    @pos + (state == :open ? 1 : 2)
  end
end

class Game
  BowlingError = Class.new ArgumentError
  def initialize
    @rolls = []
    @current_frame = 0
    @frames = Array.new(10) { |i| Frame.new id: i + 1 }
  end

  def roll(pins_knocked)
    raise BowlingError unless (0..10).include? pins_knocked
    # record pins knocked
    @rolls << pins_knocked
    frame = @frames[@current_frame]
    last = @frames.last

    if !last.state.nil? && @rolls.size > last.get_end_pos + 1
      raise BowlingError, "Game is over"
    end

    if (last.state == :strike) && @rolls.size > last.get_end_pos
      if @rolls[-2] < 10 && @rolls[-2..-1].sum > 10
        raise BowlingError, "Cannot add more than 10"
      end
    end

    # new frame
    if frame.state.nil?
      # only set the frame location if new
      frame.pos = @rolls.size - 1
      if pins_knocked == 10
        frame.state = :strike
        @current_frame = [@current_frame + 1, 9].min
      else
        frame.state = :open
      end
      # frame exists
    elsif frame.state == :open

      score = @rolls[frame.pos] + @rolls[frame.pos + 1]
      raise BowlingError, "Invalid Score" if score > 10
      # spare if we manage to knock
      frame.state = :spare if score == 10
      @current_frame = [@current_frame + 1, 9].min
    end
  end

  def score
    last = @frames.last

    if last.state.nil? || last.state != :open && @rolls.size <= last.get_end_pos
      raise BowlingError, "Incomplete Game"
    end

    @frames.reduce(0) do |total, frame|
      case frame.state
      when :strike
        total += @rolls[frame.pos + 1] + @rolls[frame.pos + 2]
      when :spare
        total += @rolls[frame.pos + 1] + @rolls[frame.pos + 2]
      when :open
        total += @rolls[frame.pos + 1]
      end
      total + @rolls[frame.pos]
    end
  end
end
