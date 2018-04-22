require "./environment"

RSpec.describe Environment do
  subject { described_class.new([5,3]) }

  it "returns response for an allowed move" do
    move = subject.check_move(5,3)
    expect(move.allowed).to eq true
  end

  it "returns response for a lost move" do
    move = subject.check_move(6,3)
    expect(move.allowed).to eq false
    expect(move.lost).to eq true
  end

  it "returns response for a previously lost move" do
    first_move = subject.check_move(6,3)
    second_move = subject.check_move(6,3)
    expect(second_move.allowed).to eq false
    expect(second_move.lost).to eq false
  end
end
