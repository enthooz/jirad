# frozen_string_literal: true

RSpec.describe Rubira::Issue do
  let(:issue_hash) { build(:issue) }

  it_behaves_like 'a basic issue'
  it_behaves_like 'an issue with basic associations'

  context 'with issue hash' do
    subject(:issue) { described_class.new(issue_hash) }

    it 'sets reporter' do
      expect(issue.reporter).to be_an_instance_of(Rubira::Person)
    end

    it 'sets assignee' do
      expect(issue.assignee).to be_an_instance_of(Rubira::Person)
    end

    it 'sets components' do
      expect(issue.components).to respond_to(:each)
    end

    it 'sets issue links' do
      expect(issue.issue_links).to respond_to(:each)
    end

    it 'sets created' do
      expect(issue.created).to be_an_instance_of(Rubira::Timestamp)
    end

    it 'sets updated' do
      expect(issue.updated).to be_an_instance_of(Rubira::Timestamp)
    end
  end
end
