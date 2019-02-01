class Jirad::IssueStatus < Jirad::BaseModel
  attribute :name
  attribute :category, key: [ 'statusCategory', 'name' ]

  # TODO: make StatusCategory model

  alias_method :to_s, :name

  def is?(symbol)
    name.to_sym == symbol
  end

  # :to_do, :in_progress, :done
  def category_is?(symbol)
    category.to_sym == symbol
  end
end
