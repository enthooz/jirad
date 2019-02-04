# frozen_string_literal: true

RSpec.shared_context 'with FactoryHelper.clear_factories!' do
  after(:all) do
    described_class.clear_factories!
    described_class.find_definitions
  end
end
