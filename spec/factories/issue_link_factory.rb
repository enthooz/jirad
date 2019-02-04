# frozen_string_literal: true

FactoryHelper.define(:issue_link) do
  id            = Faker::Number.number(5).to_s
  site          = Faker::Internet.domain_word
  outward_issue = FactoryHelper.build_from(:base_issue)

  # rubocop:disable Metrics/LineLength
  {
    'id'           => id,
    'self'         => "https://#{site}.atlassian.net/rest/api/2/issueLink/#{id}",
    'type'         => {
      'id'      => id,
      'name'    => 'Relates',
      'inward'  => 'relates to',
      'outward' => 'relates to',
      'self'    => "https://#{site}.atlassian.net/rest/api/2/issueLinkType/#{outward_issue['id']}"
    },
    'outwardIssue' => outward_issue
  }
  # rubocop:enable Metrics/LineLength
end
