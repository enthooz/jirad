# frozen_string_literal: true

FactoryHelper.define(:component) do
  site           = Faker::Internet.domain_word
  component_id   = Faker::Number.number(5)
  component_name = Faker::HitchhikersGuideToTheGalaxy.specie

  # rubocop:disable Metrics/LineLength
  {
    'self' => "https://#{site}.atlassian.net/rest/api/2/component/#{component_id}",
    'id'   => component_id.to_s,
    'name' => component_name
  }
  # rubocop:enable Metrics/LineLength
end
