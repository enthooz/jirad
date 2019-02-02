# frozen_string_literal: true

class Jirad::Issue < Jirad::BaseIssue
  person :reporter,        key: %w[fields creator]
  person :assignee,        key: %w[fields assignee]
  collection :components,  key: %w[fields components], type: Jirad::Component
  collection :issue_links, key: %w[fields issuelinks], type: Jirad::IssueLink
  timestamp :created,      key: %w[fields created]
  timestamp :updated,      key: %w[fields updated]

  ISSUE_LIMIT = 1000

  def self.search(jql, &block)
    query = { jql: jql }
    issues = []
    begin
      response = Jirad.client.get('search', query: query)
      these_issues = response['issues'].collect { |issue| Jirad::Issue.new(issue) }
      issues.concat(these_issues)
      block.call(these_issues) if block_given?
      query[:startAt] = response['startAt'] + response['maxResults']
    end while query[:startAt] < response['total'] && query[:startAt] << ISSUE_LIMIT
    issues
  end

  def change_log
    get('changelog', 'values', Jirad::ChangeEvent)
  end

  def comments
    get('comment', 'comments', Jirad::Comment)
  end

  def work_log
    get('worklog', 'worklogs', Jirad::WorkEvent)
  end

  protected

  def get(path, key, klass)
    response = Jirad.client.get("issue/#{id}/#{path}")
    response[key].collect { |event| klass.new(event) }
  end
end
