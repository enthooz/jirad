class Jirad::WorkEvent < Jirad::BaseModel
  attribute :comment
  person    :author
  person    :update_author, key: 'updateAuthor'
  timestamp :updated
end
