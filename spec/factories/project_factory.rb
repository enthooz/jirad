# frozen_string_literal: true

FactoryHelper.define(:project) do
  site        = Faker::Internet.domain_word
  id          = Faker::Number.number(1).to_s
  number      = Faker::Number.number(5)

  # rubocop:disable Metrics/LineLength
  {
    'self'           => "https://#{site}.atlassian.net/rest/api/2/project/#{id}",
    'id'             => id.to_s,
    'key'            => 'RAD',
    'name'           => 'Really Awesome Device',
    'projectTypeKey' => 'software',
    'avatarUrls'     => {
      '48x48' => "https://#{site}.atlassian.net/secure/projectavatar?avatarId=#{number}",
      '24x24' => "https://#{site}.atlassian.net/secure/projectavatar?size=small&avatarId=#{number}",
      '16x16' => "https://#{site}.atlassian.net/secure/projectavatar?size=xsmall&avatarId=#{number}",
      '32x32' => "https://#{site}.atlassian.net/secure/projectavatar?size=medium&avatarId=#{number}"
    }
  }
  # rubocop:enable Metrics/LineLength
end
