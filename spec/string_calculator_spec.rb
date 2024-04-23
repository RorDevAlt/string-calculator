require_relative '../string_calculator'

describe StringCalculator do
  describe '.add' do
    context 'method arguments' do
      it 'expects only one string argument' do
        expect { described_class.add('1') }.to_not raise_error
        expect { described_class.add(1) }.to raise_error
        expect { described_class.add(1, 2) }.to raise_error
        expect { described_class.add('1', '2') }.to raise_error
      end
    end

    context 'when blank string passed' do
      it "returns 0" do
        expect(described_class.add("")).to eq 0 
      end
    end

    context 'when valid string with numbers' do
      it 'returns sum of passed numbers' do
        expect(described_class.add("1")).to eq 1
        expect(described_class.add("1,2")).to eq 3
        expect(described_class.add("1,2,3")).to eq 6
      end
    end

    context "when string contains valid new line character" do
      it 'returns sum of passed numbers' do
        expect(described_class.add("1\n2,3")).to eq 6
      end
    end

    context "when string contains invalid new line char" do
      it "return error when invalid \n passed" do
        expect(described_class.add("1,\n")).to eq 'Invalid input'
      end
    end

    context "when string has different delimiter" do
      it "considers delimiter and sum number" do
        "//[delimiter]\n[numbers…]"
        expect(described_class.add("//;\n1;2")).to eq 3
      end
    end
  end
end