require 'pry'
require_relative './simulator'

class Application
  attr_accessor :grid, :robots
  attr_reader :simulator

  def initialize(simulator = Simulator.new)
    @grid = []
    @robots = []
    @simulator = simulator
  end

  def launch
   grid_input
   robot_input
   run_instructions
  end

private

  def grid_input
    puts 'Please enter the grid coordinates:'
    self.grid = format_input(gets.chomp)
  end

  def robot_input
    loop do
      puts ' Please enter a start position for a robot, or type run:'
      input = gets.chomp
      break if input.downcase == 'run'
      start_position = format_input(input)
      puts 'Please enter instructions for the robot:'
      instructions = gets.chomp
      robots << [start_position, instructions]
    end
  end

  def run_instructions
    output = simulator.run(grid, robots)
    print_output(output)
  end

  def print_output(output)
    puts output.map {|line| line.join(" ") }
  end

  def format_input(input)
    input.split(" ").map {|s| is_number?(s) ? s.to_i : s.upcase }
  end

  def is_number?(str)
    true if Integer(str) rescue false
  end
end

app = Application.new
app.launch
