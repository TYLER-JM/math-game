class Player
  attr_accessor :name, :lives
  def initialize(n)
    @name = n
    @lives = 3
  end

  def loose_life
    @lives -= 1
  end

end