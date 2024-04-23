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
  end
end