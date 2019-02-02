# frozen_string_literal: true

class Jirad::BaseIssue < Jirad::BaseModel
  attr_reader :issue

  attribute :id
  attribute :key
  attribute :summary,     key: %w[fields summary]
  attribute :description, key: %w[fields description]
  attribute :summary,     key: %w[fields summary]
  attribute :summary,     key: %w[fields summary]
  attribute :type,        key: %w[fields issuetype], type: Jirad::IssueType
  attribute :status,      key: %w[fields status],    type: Jirad::IssueStatus
  attribute :priority,    key: %w[fields priority],  type: Jirad::Priority

  def initialize(issue)
    super
    @client = Jirad.client
  end

  def field(field_name)
    @hash['fields'][field_name.to_s]
  end
end
