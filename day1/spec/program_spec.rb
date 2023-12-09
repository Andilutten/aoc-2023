require "program"

describe Program do
  describe '.run' do
    context 'given test input' do
      it "returns 142" do
        output = Program::run(IO::readlines("./test.txt"))
        expect(output).to eq 142
      end
    end
    context 'given test2 input' do
      it "returns 281" do
        output = Program::run_two(IO::readlines("./test2.txt"))
        expect(output).to eq 281
      end
    end
  end
end
