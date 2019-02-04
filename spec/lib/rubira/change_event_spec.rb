# frozen_string_literal: true

RSpec.describe Rubira::ChangeEvent do
  let(:change_event_hash) { build(:change_event) }

  context 'with change hash' do
    subject(:change_event) { described_class.new(change_event_hash) }

    it 'sets author' do
      expect(change_event.author.display_name)
        .to eq change_event_hash['author']['displayName']
    end

    it 'sets timestamp' do
      expect(change_event.timestamp).to be_a(Rubira::Timestamp)
    end

    it 'sets changes' do
      expect(change_event.changes).to include(an_instance_of(Rubira::Change))
    end
  end
end
