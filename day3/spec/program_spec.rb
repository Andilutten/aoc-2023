require "program"

describe Program do
  describe '.run' do
    context 'given test input' do
      it "returns 4361" do
        output = Program::run(IO::readlines("./test.txt"))
        expect(output).to eq 4361
      end
    end
  end
end
