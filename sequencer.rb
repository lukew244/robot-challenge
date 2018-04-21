require 'pry'
require_relative './robot'

class Sequencer

  #start position [0,0,'N'], instructions "RLRL"
  def process(start_position, instructions)
    robot = Robot.new(start_position)

    dir = instructions.split("")
    dir.each_with_object(robot) do |inst, robot|
      robot.move(inst)
    end
    robot.to_array
  end
end
