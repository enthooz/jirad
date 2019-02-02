# frozen_string_literal: true

module Jirad
  # Model for issue type.
  class IssueType < BaseModel
    attribute :name
    attribute :is_subtask?, key: 'subtask'

    alias to_s name

    def is?(symbol)
      to_sym == symbol
    end

    def to_sym
      name.to_sym
    end
  end
end
