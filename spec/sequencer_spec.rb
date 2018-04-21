require "./sequencer"

RSpec.describe Sequencer do

  it "handles orientation of robot from instructions" do
    start_position = [0,0, "N"]
    expect(subject.process(start_position, "RRR")).to eq [0, 0, "W"]
    expect(subject.process(start_position, "RRLLRLR")).to eq [0, 0, "E"]
  end

  it "handles movement of robot from instructions" do
    expect(subject.process([1,1, "E"], "F")).to eq [2, 1, "E"]
    expect(subject.process([1,1, "E"], "RFRFRFRF")).to eq [1, 1, "E"]
  end

  it "knows when a robot is lost" do
    expect(subject.process([3,2, "N"], "FRRFLLFFRRFLL")).to eq [3, 3, "N", "LOST"]
    # expect(subject.process([0,3, "W"], "LLFFFLFLFL")).to eq [2, 3, "S"] #
  end
end
