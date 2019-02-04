# frozen_string_literal: true

RSpec.describe Rubira::BaseIssue do
  let(:base_issue_hash) { build(:base_issue) }

  context 'with base issue hash (associations)' do
    subject(:base_issue) { described_class.new(base_issue_hash) }

    it 'sets type' do
      expect(base_issue.type).to be_a(Rubira::IssueType)
    end

    it 'sets status' do
      expect(base_issue.status).to be_a(Rubira::IssueStatus)
    end

    it 'sets priority' do
      expect(base_issue.priority).to be_a(Rubira::Priority)
    end

    it 'sets type value correctly' do
      expect(base_issue.type.name)
        .to eq base_issue_hash['fields']['issuetype']['name']
    end

    it 'sets status value correctly' do
      expect(base_issue.status.name)
        .to eq base_issue_hash['fields']['status']['name']
    end

    it 'sets priority value correctly' do
      expect(base_issue.priority.name)
        .to eq base_issue_hash['fields']['priority']['name']
    end
  end
end
