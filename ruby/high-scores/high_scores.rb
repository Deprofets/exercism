class HighScores
  def initialize(arr)
    @scores = arr
  end
  attr_reader :scores
  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def latest_is_personal_best?
    latest == personal_best
  end

  def personal_top_three
    scores.max 3
  end
end
