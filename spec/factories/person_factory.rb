# frozen_string_literal: true

# This mimics the hash that results from parsing JSON from `creator` attribute
# of an `issue` resource returned from `jql` endpoint.
FactoryHelper.define(:issue_creator_hash) do
  full_name     = Faker::Name.name
  username      = Faker::Internet.username(full_name)
  account_id    = Faker::Crypto.md5
  sha1          = Faker::Crypto.sha1
  site          = Faker::Internet.domain_word
  email_address = Faker::Internet.safe_email(full_name)
  time_zone     = Faker::Address.time_zone

  # rubocop:disable Metrics/LineLength
  {
    'self' => "https://#{site}.atlassian.net/rest/api/2/user?accountId=#{account_id}",
    'name' => username,
    'key' => username,
    'accountId' => account_id,
    'emailAddress' => email_address,
    'displayName' => full_name,
    'active' => true,
    'timeZone' => time_zone,

    'avatarUrls' => {
      '48x48' => "https://avatar-cdn.atlassian.com/#{sha1}?s=48&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D48%26noRedirect%3Dtrue",
      '24x24' => "https://avatar-cdn.atlassian.com/#{sha1}?s=24&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D24%26noRedirect%3Dtrue",
      '16x16' => "https://avatar-cdn.atlassian.com/#{sha1}?s=16&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D16%26noRedirect%3Dtrue",
      '32x32' => "https://avatar-cdn.atlassian.com/#{sha1}?s=32&d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2F#{sha1}%3Fd%3Dmm%26s%3D32%26noRedirect%3Dtrue"
    }
  }
  # rubocop:enable Metrics/LineLength
end
