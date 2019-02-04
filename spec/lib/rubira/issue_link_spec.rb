# frozen_string_literal: true

RSpec.describe Rubira::IssueLink do
  let(:issue_link_hash) { build(:issue_link) }

  context 'with issue_link hash' do
    subject(:issue_link) { described_class.new(issue_link_hash) }

    it 'sets type' do
      expect(issue_link.type).to eq issue_link_hash['type']['name']
    end

    it 'sets inward' do
      expect(issue_link.inward).to eq issue_link_hash['inward']
    end

    it 'sets outward' do
      expect(issue_link.outward).to eq issue_link_hash['outward']
    end

    it 'sets outward issue' do
      expect(issue_link.outward_issue).to be_a(Rubira::BaseIssue)
    end

    it 'does not set inward issue' do
      expect(issue_link.inward_issue).to be_nil
    end
  end
end
