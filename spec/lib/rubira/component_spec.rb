# frozen_string_literal: true

RSpec.describe Rubira::Component do
  let(:component_hash) { build(:component) }

  context 'with component hash' do
    subject(:component) { described_class.new(component_hash) }

    it 'sets name' do
      expect(component.name).to eq component_hash['name']
    end
  end
end
