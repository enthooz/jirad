# frozen_string_literal: true

RSpec.describe Rubira::Person, '.new' do
  let(:person_hash) { build(:person) }

  context 'with user hash from issue creator' do
    subject(:person) { described_class.new(person_hash) }

    it 'sets name' do
      expect(person.name).to eq person_hash['name']
    end

    it 'sets key' do
      expect(person.key).to eq person_hash['key']
    end

    it 'sets account id' do
      expect(person.account_id).to eq person_hash['accountId']
    end

    it 'sets email address' do
      expect(person.email_address).to eq person_hash['emailAddress']
    end

    it 'sets display name' do
      expect(person.display_name).to eq person_hash['displayName']
    end

    it 'sets active boolean' do
      expect(person.is_active?).to be person_hash['active']
    end

    it 'sets timezone' do
      expect(person.timezone).to eq person_hash['timeZone']
    end
  end
end
