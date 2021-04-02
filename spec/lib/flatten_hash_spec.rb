require 'flatten_hash'

describe FlattenHash do
  describe '.call' do
    let(:result) { described_class.call(hash) }
    let(:hash) do
      {
        controller: 'wizard',
        wizard: {
          'hidden-class': 'hidden',
          'current-step-class': 'ui-step--current',
          'step-position-value': '1'
        }
      }
    end

    let(:expected_hash) do
      {
        controller: 'wizard',
        'wizard-hidden-class': 'hidden',
        'wizard-current-step-class': 'ui-step--current',
        'wizard-step-position-value': '1'
      }
    end

    it 'returns the expected hash' do
      expect(result).to eq expected_hash
    end
  end
end
