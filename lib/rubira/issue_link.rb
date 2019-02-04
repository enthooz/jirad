# frozen_string_literal: true

module Rubira
  # Model for issue links.
  class IssueLink < BaseModel
    attribute :type, key: %w[type name] # e.g. "Duplicate"
    attribute :inward             # e.g. "duplicated by"
    attribute :outward            # e.g. "duplicates"
    attribute :outward_issue, key: 'outwardIssue', type: Rubira::BaseIssue
    attribute :inward_issue,  key: 'inwardIssue',  type: Rubira::BaseIssue
    # TODO: there may be an inwardIssue
  end
end
