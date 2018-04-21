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
    expect(subject.process([0,3, "W"], "LLFFFLLFL")).to eq [2, 3, "S"]
  end

  # 3 2 N FRRFLLFFRRFLL
  # 0 3 W
end
