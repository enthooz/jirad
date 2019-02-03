# frozen_string_literal: true

RSpec.describe FactoryHelper do
  include_context 'with FactoryHelper.clear_factories!'

  context 'without inheritance' do
    before do
      described_class.clear_factories!
      described_class.define(:my_factory) do
        { abc: 123, def: 456 }
      end
    end

    it 'builds properly' do
      expect(build(:my_factory)).to match(abc: 123, def: 456)
    end
  end
end
