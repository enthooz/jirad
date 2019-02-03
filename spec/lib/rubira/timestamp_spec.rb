# frozen_string_literal: true

RSpec.describe Rubira::Timestamp do
  subject(:timestamp) { described_class.parse('2019-01-16T09:00:36.613-0800') }

  describe '#to_s' do
    it 'prints out in human readable format' do
      expect(timestamp.to_s).to eq '2019-01-16 09:00:36 -08:00'
    end
  end
end
