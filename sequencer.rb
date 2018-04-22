require 'pry'
require_relative './robot'
require_relative './environment'

class Sequencer

  def process(grid, instruction_sets, environment = Environment.new(grid))
    instruction_sets.map { |set| process_set(set, environment) }
  end

  def process_set(set, environment)
    start_position, instructions = set[0], set[1].split("")
    robot = Robot.new(start_position, environment)
    robot.process_moves(instructions)
  end
end
