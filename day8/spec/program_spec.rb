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
        output = Program::star_two(IO::readlines("./test.txt"))
        expect(output).to eq "Not implemented"
      end
    end
  end
end
