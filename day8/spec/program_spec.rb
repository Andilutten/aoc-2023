require "program"

describe Program do
  describe '.star_one' do
    context 'given test input 1' do
      it "returns expected output" do
        input = [
          "RL",
          "",
          "AAA = (BBB, CCC)",
          "BBB = (DDD, EEE)",
          "CCC = (ZZZ, GGG)",
          "DDD = (DDD, DDD)",
          "EEE = (EEE, EEE)",
          "GGG = (GGG, GGG)",
          "ZZZ = (ZZZ, ZZZ)",
        ]
        output = Program::star_one(input)
        expect(output).to eq 2
      end
    end
    context 'given test input 2' do
      it "returns expected output" do
        input = [
          "LLR",
          "",
          "AAA = (BBB, BBB)",
          "BBB = (AAA, ZZZ)",
          "ZZZ = (ZZZ, ZZZ)",
        ]
        output = Program::star_one(input)
        expect(output).to eq 6
      end
    end
  end
  describe '.star_two' do
    context 'given test input' do
      it "returns expected output" do
        input = [
          "LR",
          "",
          "11A = (11B, XXX)",
          "11B = (XXX, 11Z)",
          "11Z = (11B, XXX)",
          "22A = (22B, XXX)",
          "22B = (22C, 22C)",
          "22C = (22Z, 22Z)",
          "22Z = (22B, 22B)",
          "XXX = (XXX, XXX)",
        ]
        output = Program::star_two(input)
        expect(output).to eq 6
      end
    end
  end
end
