# frozen_string_literal: true

RSpec.shared_context 'with FactoryHelper.clear_factories!' do
  before(:all) do
    module FactoryHelper
      def self.clear_factories!
        @factories = {}
      end
    end
  end

  after(:all) do
    described_class.clear_factories!
    described_class.find_definitions
  end
end
