class Bob
  def self.hey(remark)
    remark = remark.strip
    remark_chars = remark.scan(/[a-z!?]/im)
    len = remark_chars.size
    has_question = remark_chars.last == '?'
    is_yelling = remark.scan(/[A-Z!]/).size > len * 0.5
    return "Sure." if has_question && !is_yelling
    return "Calm down, I know what I'm doing!" if has_question && is_yelling
    return "Whoa, chill out!" if is_yelling
    return "Fine. Be that way!" if remark.empty?
    "Whatever."
  end
end

#
# Bob answers 'Sure.' if you ask him a question.
#
# He answers 'Whoa, chill out!' if you yell at him.
#
# He answers 'Calm down, I know what I'm doing!' if you yell a question at him.
#
# He says 'Fine. Be that way!' if you address him without actually saying
# anything.
#
# He answers 'Whatever.' to anything else.
