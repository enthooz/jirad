# frozen_string_literal: true

FactoryHelper.define(:issue_status) do
  site        = Faker::Internet.domain_word
  id          = Faker::Number.number(1).to_s
  description = Faker::Hacker.say_something_smart
  name        = Faker::Hacker.adjective

  # rubocop:disable Metrics/LineLength
  {
    'self'           => "https://#{site}.atlassian.net/rest/api/2/status/#{id}",
    'description'    => description,
    'iconUrl'        => "https://#{site}.atlassian.net/images/icons/statuses/#{name}.png",
    'name'           => name,
    'id'             => id,
    'statusCategory' => {
      'self'      => "https://#{site}.atlassian.net/rest/api/2/statuscategory/3",
      'id'        => 3,
      'key'       => 'done',
      'colorName' => 'green',
      'name'      => 'Done'
    }
  }
  # rubocop:enable Metrics/LineLength
end
