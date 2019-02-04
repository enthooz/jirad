# frozen_string_literal: true

module Rubira
  # Model for changes within change logs.  Used by `Issue#change_log`.
  class ChangeEvent < BaseModel
    person     :author
    timestamp  :timestamp, key: 'created'
    collection :changes, type: Rubira::Change, key: 'items'
  end
end
