# frozen_string_literal: true

FactoryHelper.define(:base_issue) do
  site    = Faker::Internet.domain_word
  key     = "RAD-#{Faker::Number.number(4)}"
  id      = Faker::Number.number(5)
  summary = Faker::HitchhikersGuideToTheGalaxy.starship
  {
    'id'     => id,
    'key'    => key,
    'self'   => "https://#{site}.atlassian.net/rest/api/2/issue/#{id}",
    'fields' => {
      'summary'   => summary,
      'status'    => FactoryHelper.build_from(:issue_status),
      'priority'  => FactoryHelper.build_from(:priority),
      'issuetype' => FactoryHelper.build_from(:issue_type)
    }
  }
end
