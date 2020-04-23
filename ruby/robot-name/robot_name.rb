class Robot
  @@chars = ('A'..'Z').to_a
  @@names = Hash.new(0)

  def self.genName
    name = ""
    name << @@chars[rand 26]
    name << @@chars[rand 26]
    name << "%03d" % (rand * 1000)

    name.freeze
  end

  def self.forget
    @@names = Hash.new(0)
  end

  def initialize
    while @@names[@name = self.class.genName] != 0
      @name = self.class.genName
    end
    @@names[@name] = 1
  end

  attr_accessor :name
  def reset
    @@names[@name] = 0
    initialize
  end
end
