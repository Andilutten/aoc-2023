require "program"

describe Program do
  describe '.star_one' do
    context 'given test input' do
      it "returns expected output" do
        output = Program::star_one(IO::readlines("./test.txt"))
        expect(output).to eq 288
      end
    end
  end
  describe '.star_two' do
    context 'given test input' do
      it "returns expected output" do
        output = Program::star_two(IO::readlines("./test.txt"))
        expect(output).to eq 71503
      end
    end
  end
end
