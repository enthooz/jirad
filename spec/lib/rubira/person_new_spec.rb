# frozen_string_literal: true

RSpec.describe Rubira::Person, '.new' do
  let(:issue_creator_hash) do
    {
      'self' => 'https://kautzerlittel.atlassian.net/rest/api/2/user?accountId=7725897bc05e32bc57157b6f68cc746f',
      'name' => 'lacie',
      'key' => 'lacie',
      'accountId' => '7725897bc05e32bc57157b6f68cc746f',
      'emailAddress' => 'laciestroman@kautzerlittel.co',
      'avatarUrls' => {
        '48x48' => 'https://avatar-cdn.atlassian.com/b7f3c6885ed9f2fa57c3db26a359afb0a8db1d37?s=48&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fb7f3c6885ed9f2fa57c3db26a359afb0a8db1d37%3Fd%3Dmm%26s%3D48%26noRedirect%3Dtrue',
        '24x24' => 'https://avatar-cdn.atlassian.com/b7f3c6885ed9f2fa57c3db26a359afb0a8db1d37?s=24&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fb7f3c6885ed9f2fa57c3db26a359afb0a8db1d37%3Fd%3Dmm%26s%3D24%26noRedirect%3Dtrue',
        '16x16' => 'https://avatar-cdn.atlassian.com/b7f3c6885ed9f2fa57c3db26a359afb0a8db1d37?s=16&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fb7f3c6885ed9f2fa57c3db26a359afb0a8db1d37%3Fd%3Dmm%26s%3D16%26noRedirect%3Dtrue',
        '32x32' => 'https://avatar-cdn.atlassian.com/b7f3c6885ed9f2fa57c3db26a359afb0a8db1d37?s=32&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fb7f3c6885ed9f2fa57c3db26a359afb0a8db1d37%3Fd%3Dmm%26s%3D32%26noRedirect%3Dtrue'
      },
      'displayName' => 'Lacie Stroman',
      'active' => true,
      'timeZone' => 'America/Boise'
    }
  end

  context 'with user hash from issue creator' do
    subject(:person) { described_class.new(issue_creator_hash) }

    it 'sets name' do
      expect(person.key).to eq 'lacie'
    end

    it 'sets key' do
      expect(person.key).to eq 'lacie'
    end

    it 'sets account id' do
      expect(person.account_id).to eq '7725897bc05e32bc57157b6f68cc746f'
    end

    it 'sets email address' do
      expect(person.email_address).to eq 'laciestroman@kautzerlittel.co'
    end

    it 'sets display name' do
      expect(person.display_name).to eq 'Lacie Stroman'
    end

    it 'sets active boolean' do
      expect(person.is_active?).to be true
    end

    it 'sets timezone' do
      expect(person.timezone).to eq 'America/Boise'
    end
  end
end
