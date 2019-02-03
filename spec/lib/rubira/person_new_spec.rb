# frozen_string_literal: true

RSpec.describe Rubira::Person, '.new' do
  let(:person_attributes) { build(:issue_creator_hash) }

  context 'with user hash from issue creator' do
    subject(:person) { described_class.new(person_attributes) }

    it 'sets name' do
      expect(person.name).to eq person_attributes['name']
    end

    it 'sets key' do
      expect(person.key).to eq person_attributes['key']
    end

    it 'sets account id' do
      expect(person.account_id).to eq person_attributes['accountId']
    end

    it 'sets email address' do
      expect(person.email_address).to eq person_attributes['emailAddress']
    end

    it 'sets display name' do
      expect(person.display_name).to eq person_attributes['displayName']
    end

    it 'sets active boolean' do
      expect(person.is_active?).to be person_attributes['active']
    end

    it 'sets timezone' do
      expect(person.timezone).to eq person_attributes['timeZone']
    end
  end
end
