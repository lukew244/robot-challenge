class Robot
  attr_accessor :x, :y, :orientation

  ORIENTATIONS = %w[N E S W]

  def initialize(position)
    @x            = position[0]
    @y            = position[1]
    @orientation  = position[2]
  end

  def to_array
    [x, y, orientation]
  end

  def move(move)
    case move
    when "L"
      move_left
    when "R"
      move_right
    when "F"
      move_forward
    end
  end

  private

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
      self.y += 1
    when 'E'
      self.x += 1
    when 'S'
      self.y -= 1
    when 'W'
      self.x -= 1
    end
  end
end
