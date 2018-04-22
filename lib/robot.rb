class Robot
  attr_accessor :x, :y, :orientation, :lost
  attr_reader :environment

  ORIENTATIONS = %w[N E S W]
  LOST = 'LOST'

  def initialize(position, environment = nil)
    @x            = position[0]
    @y            = position[1]
    @orientation  = position[2]
    @environment  = environment
    @lost         = nil
  end

  def position
    [x, y, orientation, lost].compact
  end

  def process_moves(moves)
    moves.map {|m| move(m) }
    position
  end

  private

  def move(move)
    return if lost
    case move
    when "L"
      move_left
    when "R"
      move_right
    when "F"
      move_forward
    end
  end

  def move_left
    if orientation == 'N'
      self.orientation = 'W'
    else
      self.orientation = ORIENTATIONS[ORIENTATIONS.find_index(orientation) - 1]
    end
  end

  def move_right
    if orientation == 'W'
      self.orientation = 'N'
    else
      self.orientation = ORIENTATIONS[ORIENTATIONS.find_index(orientation) + 1]
    end
  end

  def move_forward
    case orientation
    when 'N'
      self.y += 1 if move_allowed?(x, y + 1)
    when 'E'
      self.x += 1 if move_allowed?(x + 1, y)
    when 'S'
      self.y -= 1 if move_allowed?(x, y - 1)
    when 'W'
      self.x -= 1 if move_allowed?(x - 1, y)
    end
  end

  def move_allowed?(x, y)
    return true if environment.nil?
    move = environment.check_move(x, y)
    if move.allowed
       true
    else
      set_lost if move.lost
      false
    end
  end

  def set_lost
    self.lost = LOST
  end
end
