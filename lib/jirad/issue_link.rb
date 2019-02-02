# frozen_string_literal: true

class Jirad::IssueLink < Jirad::BaseModel
  attribute :type, key: 'name'  # e.g. "Block"
  attribute :inward             # e.g. "blocks"
  attribute :outward            # e.g. "is blocked by"
  attribute :issue, key: 'outwardIssue', type: Jirad::BaseIssue
  # TODO: there may be an inwardIssue
end
