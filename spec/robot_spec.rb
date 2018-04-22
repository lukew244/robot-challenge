require "./lib/robot"

RSpec.describe Robot do
  subject { described_class.new([0,0, "N"]) }

  it "handles orientation from instructions" do
    expect(subject.process_moves("RRLLRLR".split(""))).to eq [0, 0, "E"]
  end

  it "handles movement from instructions" do
    expect(subject.process_moves("RFRFRFRF".split(""))).to eq [0, 0, "N"]
    expect(subject.process_moves("FFFRFF".split(""))).to eq [2, 3, "E"]
  end

  context "when an environment is present" do
    it "ignores moves not allowed" do
      env = double("environment")
      not_allowed = double("move", allowed: false, lost: false)
      robot = Robot.new([0,0, "N"], env)
      allow(env).to receive(:check_move).and_return(not_allowed)
      expect(robot.process_moves("LLF".split(""))).to eq [0, 0, "S"]
    end

    it 'handles a lost response' do
      env = double("environment")
      not_allowed = double("move", allowed: false, lost: true)
      robot = Robot.new([0,0, "N"], env)
      allow(env).to receive(:check_move).and_return(not_allowed)
      expect(robot.process_moves("F".split(""))).to eq [0, 0, "N", "LOST"]
    end
  end

end
