# frozen_string_literal: true

RSpec.describe Rubira::Change do
  let(:change_hash) { build(:change) }

  context 'with change hash' do
    subject(:change) { described_class.new(change_hash) }

    it 'sets field' do
      expect(change.field).to eq change_hash['field']
    end

    it 'sets field type' do
      expect(change.field_type).to eq change_hash['fieldType']
    end

    it 'sets field id' do
      expect(change.field_id).to eq change_hash['fieldId']
    end

    it 'sets from' do
      expect(change.from).to eq change_hash['fromString']
    end

    it 'sets to' do
      expect(change.to).to eq change_hash['toString']
    end

    it 'sets from ID' do
      expect(change.from_id).to eq change_hash['from']
    end

    it 'sets to ID' do
      expect(change.to_id).to eq change_hash['to']
    end
  end
end
