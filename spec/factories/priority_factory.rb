# frozen_string_literal: true

FactoryHelper.define(:priority) do
  site = Faker::Internet.domain_word

  # rubocop:disable Metrics/LineLength
  {
    'self'    => "https://#{site}.atlassian.net/rest/api/2/priority/2",
    'iconUrl' => "https://#{site}.atlassian.net/images/icons/priorities/critical.svg",
    'name'    => 'High',
    'id'      => '2'
  }
  # rubocop:enable Metrics/LineLength
end
