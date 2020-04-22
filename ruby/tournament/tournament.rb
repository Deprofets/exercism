class TeamData
  def initialize
    @data = { MP: 0, W: 0, D: 0, L: 0, P: 0 }
  end
  attr_accessor :data

  def points
    @data[:P]
  end

  # @param result [String]
  def update(match_result)
    @data[:MP] += 1
    case match_result
    when "win"
      @data[:W] += 1
      @data[:P] += 3
    when "lose"
      @data[:L] += 1
    else
      @data[:D] += 1
      @data[:P] += 1
    end
  end
end

class Tournament
  def self.tally(input)
    # @type [Hash{String => TeamData}]
    data = Hash.new { |h, k| h[k] = TeamData.new }
    input.strip!

    input.each_line do |row|
      team1, team2, result = row.split(';')

      case result.strip
      when "draw"
        data[team1].update "draw"
        data[team2].update "draw"
      when "win"
        data[team1].update "win"
        data[team2].update "lose"
      when "loss"
        data[team2].update "win"
        data[team1].update "lose"
      end
    end

    print = ->(team, args) { "#{"%-31s" % team}| #{args.join(' | ')}\n" }

    cols = %w(MP W D L P).map { |col| col.rjust 2 }
    output = "" << print.call("Team", cols)

    sorted_data = data.sort do |(t1_name, t1_scores), (t2_name, t2_scores)|
      if t1_scores.points == t2_scores.points
        t1_name <=> t2_name
      else
        t2_scores.points <=> t1_scores.points
      end
    end

    sorted_data.each do |team, scores|
      output << print.call(team, scores.data.values.map { |v| v.to_s.rjust 2 })
    end

    output
  end
end
