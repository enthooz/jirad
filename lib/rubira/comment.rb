# frozen_string_literal: true

module Jirad
  # Model for issue comments.  Used by `Issue#comments`.
  class Comment < BaseModel
    person :update_author, key: 'updateAuthor'
    attribute :body
    timestamp :created
    timestamp :updated
  end
end
