require 'pry'
require_relative './robot'
require_relative './environment'

class Sequencer

  #start position [0,0,'N'], instructions "RLRL"
  def process(start_position, instructions)
    grid = [5, 3]
    environment = Environment.new(grid)
    robot = Robot.new(start_position, environment)

    dir = instructions.split("")
    dir.each_with_object(robot) do |inst, robot|
      robot.move(inst)
    end
    robot.to_array
  end
end
