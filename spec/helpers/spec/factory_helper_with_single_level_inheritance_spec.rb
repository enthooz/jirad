# frozen_string_literal: true

RSpec.describe FactoryHelper do
  include_context 'with FactoryHelper.clear_factories!'

  context 'with single-level inheritance' do
    before do
      described_class.clear_factories!
      described_class.define(:parent_factory) do
        { abc: 123, def: 456 }
      end
      described_class.define(:child_factory, parent: :parent_factory) do
        { def: 999, ghi: 512 }
      end
    end

    it 'builds parent properly' do
      expect(build(:parent_factory)).to match(abc: 123, def: 456)
    end

    it 'builds child properly' do
      expect(build(:child_factory)).to match(abc: 123, def: 999, ghi: 512)
    end
  end
end
