# frozen_string_literal: true

module Rubira
  # Model for issue comments.  Used by `Issue#comments`.
  class Comment < BaseModel
    person    :author
    person    :update_author, key: 'updateAuthor'
    attribute :body
    timestamp :created
    timestamp :updated
  end
end
