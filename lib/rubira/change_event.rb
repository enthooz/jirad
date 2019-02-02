# frozen_string_literal: true

module Jirad
  # Model for changes within change logs.  Used by `Issue#change_log`.
  class ChangeEvent < BaseModel
    person     :author
    timestamp  :timestamp
    collection :changes, type: Jirad::Change, key: 'items'
  end
end
