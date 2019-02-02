# frozen_string_literal: true

module Rubira
  # Model for issues.
  class Issue < BaseIssue
    person :reporter,        key: %w[fields creator]
    person :assignee,        key: %w[fields assignee]
    collection :components,  key: %w[fields components], type: Rubira::Component
    collection :issue_links, key: %w[fields issuelinks], type: Rubira::IssueLink
    timestamp :created,      key: %w[fields created]
    timestamp :updated,      key: %w[fields updated]

    class << self
      def search(jql)
        query = { jql: jql }
        issues = []
        Rubira.client.paginate('search', query: query) do |response|
          issue_batch = response['issues'].collect { |issue| new(issue) }
          issues.concat(issue_batch)
          yield issue_batch if block_given?
        end
        issues
      end
    end

    def change_log
      get('changelog', 'values', Rubira::ChangeEvent)
    end

    def comments
      get('comment', 'comments', Rubira::Comment)
    end

    def work_log
      get('worklog', 'worklogs', Rubira::WorkEvent)
    end

    protected

    def get(path, key, klass)
      response = Rubira.client.get("issue/#{id}/#{path}")
      response[key].collect { |event| klass.new(event) }
    end
  end
end
