require_relative './robot'
require_relative './environment'

class Simulator
  def run(grid, instruction_sets, environment = Environment.new(grid))
    instruction_sets.map { |set| process_set(set, environment) }
  end

  private

  def process_set(set, environment)
    start_position, instructions = set[0], set[1].split("")
    Robot.new(start_position, environment).process_moves(instructions)
  end
end
