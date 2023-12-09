require "program"

describe Program do
  describe '.run' do
    context 'given test input' do
      it "returns Hello World" do
        output = Program::run(IO::readlines("./test.txt"))
        expect(output).to eq 8
      end
    end
  end
end
