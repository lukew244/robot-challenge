class Environment
  attr_reader :upper_x, :upper_y, :lost_locations

  def initialize(grid)
    @upper_x        = grid[0]
    @upper_y        = grid[1]
    @lost_locations = []
  end

  def check_move(x, y)
    Move.new(within_bounds?(x, y), lost(x, y))
  end

  private

  def within_bounds?(x, y)
    x.between?(0, upper_x) && y.between?(0, upper_y)
  end

  def lost(x, y)
    if !within_bounds?(x, y) && !lost_locations.include?([x, y])
      self.lost_locations << [x, y]
      true
    else
      false
    end
  end

  class Move < Struct.new(:allowed, :lost)
    def initialize(allowed, lost)
      self.allowed = allowed
      self.lost = lost
    end
  end
end
