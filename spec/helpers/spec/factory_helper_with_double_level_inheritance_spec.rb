# frozen_string_literal: true

RSpec.describe FactoryHelper do
  include_context 'with FactoryHelper.clear_factories!'

  context 'with double-level inheritance' do
    before do
      described_class.clear_factories!
      described_class.define(:grand_parent_factory) do
        { abc: 123, def: 456 }
      end
      described_class.define(:parent_factory, parent: :grand_parent_factory) do
        { def: 999, ghi: 512 }
      end
      described_class.define(:child_factory, parent: :parent_factory) do
        { abc: 23, jkl: 42 }
      end
    end

    it 'builds grand parent properly' do
      expect(build(:grand_parent_factory)).to match(abc: 123, def: 456)
    end

    it 'builds parent properly' do
      expect(build(:parent_factory)).to match(abc: 123, def: 999, ghi: 512)
    end

    it 'builds child properly' do
      expect(build(:child_factory))
        .to match(abc: 23, def: 999, ghi: 512, jkl: 42)
    end
  end
end
