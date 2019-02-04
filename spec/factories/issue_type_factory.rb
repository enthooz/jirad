# frozen_string_literal: true

FactoryHelper.define(:issue_type) do
  site = Faker::Internet.domain_word

  # rubocop:disable Metrics/LineLength
  {
    'self'        => "https://#{site}.atlassian.net/rest/api/2/issuetype/10001",
    'id'          => '10001',
    'description' => 'A user story. Created by JIRA Software - do not edit or delete.',
    'iconUrl'     => "https://#{site}.atlassian.net/images/icons/issuetypes/story.svg",
    'name'        => 'Story',
    'subtask'     => false
  }
  # rubocop:enable Metrics/LineLength
end
