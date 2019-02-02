# frozen_string_literal: true

module Jirad
  # Model for work events returned within worklogs.  Used by `Issue#work_log`.
  class WorkEvent < BaseModel
    attribute :comment
    person    :author
    person    :update_author, key: 'updateAuthor'
    timestamp :updated
  end
end
