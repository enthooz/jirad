# frozen_string_literal: true

RSpec.describe Rubira::BaseIssue do
  let(:base_issue_hash) { build(:base_issue) }

  context 'with base issue hash' do
    subject(:base_issue) { described_class.new(base_issue_hash) }

    it 'sets key' do
      expect(base_issue.key).to eq base_issue_hash['key']
    end
  end
end
