# frozen_string_literal: true

RSpec.describe Rubira::BaseIssue do
  let(:base_issue_hash) { build(:base_issue) }

  context 'with base issue hash (basic attributes)' do
    subject(:base_issue) { described_class.new(base_issue_hash) }

    it 'sets id' do
      expect(base_issue.id).to eq base_issue_hash['id']
    end

    it 'sets key' do
      expect(base_issue.key).to eq base_issue_hash['key']
    end

    it 'sets summary' do
      expect(base_issue.summary)
        .to eq base_issue_hash['fields']['summary']
    end

    it 'sets description' do
      expect(base_issue.description)
        .to eq base_issue_hash['fields']['description']
    end
  end
end
