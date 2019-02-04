# frozen_string_literal: true

# This mimics the hash that results from parsing JSON from `creator` attribute
# of an `issue` resource returned from `jql` endpoint.
FactoryHelper.define(:person) do
  full_name     = Faker::Name.name
  username      = Faker::Internet.username(full_name)
  account_id    = Faker::Crypto.md5
  site          = Faker::Internet.domain_word
  email_address = Faker::Internet.safe_email(full_name)
  time_zone     = Faker::Address.time_zone

  # rubocop:disable Metrics/LineLength
  {
    'self'         => "https://#{site}.atlassian.net/rest/api/2/user?accountId=#{account_id}",
    'name'         => username,
    'key'          => username,
    'accountId'    => account_id,
    'emailAddress' => email_address,
    'displayName'  => full_name,
    'active'       => true,
    'timeZone'     => time_zone,
    'avatarUrls'   => FactoryHelper.build_from(:avatar_urls)
  }
  # rubocop:enable Metrics/LineLength
end
