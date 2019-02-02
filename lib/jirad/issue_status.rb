# frozen_string_literal: true

module Jirad
  # Model for issue status.
  class IssueStatus < BaseModel
    attribute :name
    attribute :category, key: %w[statusCategory name]

    # TODO: make StatusCategory model

    alias to_s name

    def is?(symbol)
      name.to_sym == symbol
    end

    # :to_do, :in_progress, :done
    def category_is?(symbol)
      category.to_sym == symbol
    end
  end
end
