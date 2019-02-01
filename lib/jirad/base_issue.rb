class Jirad::BaseIssue < Jirad::BaseModel
  attr_reader :issue

  attribute :id
  attribute :key
  attribute :summary,     key: [ 'fields', 'summary' ]
  attribute :description, key: [ 'fields', 'description' ]
  attribute :summary,     key: [ 'fields', 'summary' ]
  attribute :summary,     key: [ 'fields', 'summary' ]
  attribute :type,        key: [ 'fields', 'issuetype' ], type: Jirad::IssueType
  attribute :status,      key: [ 'fields', 'status' ],    type: Jirad::IssueStatus
  attribute :priority,    key: [ 'fields', 'priority' ],  type: Jirad::Priority

  def initialize(issue)
    super
    @client = Jirad.client
  end

  def field(field_name)
    @hash['fields'][field_name.to_s]
  end
end
