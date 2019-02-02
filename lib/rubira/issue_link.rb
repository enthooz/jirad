# frozen_string_literal: true

module Jirad
  # Model for issue links.
  class IssueLink < BaseModel
    attribute :type, key: 'name'  # e.g. "Duplicate"
    attribute :inward             # e.g. "duplicated by"
    attribute :outward            # e.g. "duplicates"
    attribute :outward_issue, key: 'outwardIssue', type: Jirad::BaseIssue
    attribute :inward_issue,  key: 'inwardIssue',  type: Jirad::BaseIssue
    # TODO: there may be an inwardIssue
  end
end
