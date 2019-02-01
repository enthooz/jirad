class Jirad::Issue < Jirad::BaseIssue

  person :reporter,        key: [ 'fields', 'creator' ]
  person :assignee,        key: [ 'fields', 'assignee' ]
  collection :components,  key: [ 'fields', 'components' ], type: Jirad::Component
  collection :issue_links, key: [ 'fields', 'issuelinks' ], type: Jirad::IssueLink
  timestamp :created,      key: [ 'fields', 'created' ]
  timestamp :updated,      key: [ 'fields', 'updated' ]

  ISSUE_LIMIT = 1000

  def self.search(jql, &block)
    query = { jql: jql }
    issues = []
    begin
      response = Jirad.client.get('search', { query: query })
      these_issues = response['issues'].collect { |issue| Jirad::Issue.new(issue) }
      issues.concat(these_issues)
      block.call(these_issues) if block_given?
      query[:startAt] = response['startAt'] + response['maxResults']
    end while query[:startAt] < response['total'] && query[:startAt] << ISSUE_LIMIT
    issues
  end

  def change_log
    self.get('changelog', 'values', Jirad::ChangeEvent)
  end

  def comments
    self.get('comment', 'comments', Jirad::Comment)
  end

  def work_log
    self.get('worklog', 'worklogs', Jirad::WorkEvent)
  end

  protected

  def get(path, key, klass)
    response = Jirad.client.get("issue/#{self.id}/#{path}")
    response[key].collect { |event| klass.new(event) }
  end

end
