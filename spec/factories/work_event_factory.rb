# frozen_string_literal: true

FactoryHelper.define(:work_event) do
  site     = Faker::Internet.domain_word
  author   = FactoryHelper.build_from(:person)
  issue_id = Faker::Number.number(5)
  event_id = Faker::Number.number(5)

  # rubocop:disable Metrics/LineLength
  {
    'self'             => "https://#{site}.atlassian.net/rest/api/2/issue/#{issue_id}/worklog/#{event_id}",
    'author'           => author,
    'updateAuthor'     => author,
    'created'          => '2019-01-17T05:02:52.917-0800',
    'updated'          => '2019-01-17T05:02:52.917-0800',
    'started'          => '2019-01-17T05:02:36.334-0800',
    'timeSpent'        => '3h',
    'timeSpentSeconds' => 10_800,
    'id'               => event_id.to_s,
    'issueId'          => issue_id.to_s
  }
  # rubocop:enable Metrics/LineLength
end
