# frozen_string_literal: true

RSpec.describe FactoryHelper do
  include_context 'with FactoryHelper.clear_factories!'

  context 'with multiple children' do
    before do
      described_class.clear_factories!
      described_class.define(:parent_factory) do
        { def: 999, ghi: 512 }
      end
      described_class.define(:child1_factory, parent: :parent_factory) do
        { abc: 23, jkl: 42 }
      end
      described_class.define(:child2_factory, parent: :parent_factory) do
        { abc: 123, def: 456 }
      end
    end

    it 'builds parent properly' do
      expect(build(:parent_factory)).to match(def: 999, ghi: 512)
    end

    it 'builds child #1 properly' do
      expect(build(:child1_factory))
        .to match(abc: 23, def: 999, ghi: 512, jkl: 42)
    end

    it 'builds child #2 properly' do
      expect(build(:child2_factory)).to match(abc: 123, def: 456, ghi: 512)
    end
  end
end
