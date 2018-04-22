require "./simulator"

RSpec.describe Simulator do

  it "processes instructions" do
    grid = [5,3]
    robots = [[[3,2, "N"], "FRRFLLFFRRFLL"], [[1,1, "E"], "F"], [[0,3, "W"], "LLFFFLFLFL"]]
    output = [[3, 3, "N", "LOST"], [2, 1, "E"], [2, 3, "S"]]
    expect(subject.run(grid, robots)).to eq output
  end
end
