# frozen_string_literal: true

class Jirad::Comment < Jirad::BaseModel
  person :author
  person :update_author, key: 'updateAuthor'
  attribute :body
  timestamp :created
  timestamp :updated
end
