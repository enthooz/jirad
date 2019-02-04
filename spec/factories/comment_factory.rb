# frozen_string_literal: true

FactoryHelper.define(:comment) do
  author     = FactoryHelper.build_from(:person)
  site       = Faker::Internet.domain_word
  issue_id   = Faker::Number.number(5)
  comment_id = Faker::Number.number(5)
  body       = Faker::HitchhikersGuideToTheGalaxy.quote

  # rubocop:disable Metrics/LineLength
  {
    'self'         => "https://#{site}.atlassian.net/rest/api/2/issue/#{issue_id}/comment/#{comment_id}",
    'id'           => comment_id.to_s,
    'author'       => author,
    'body'         => body,
    'updateAuthor' => author,
    'created'      => '2019-01-31T04:36:28.705-0800',
    'updated'      => '2019-01-31T04:57:55.729-0800',
    'jsdPublic'    => true
  }
  # rubocop:enable Metrics/LineLength
end
