class Jirad::Change < Jirad::BaseModel

  # Other attributes: fieldtype, fieldId, from, to
  attribute :field
  attribute :from, key: 'fromString'
  attribute :to,   key: 'toString'

  def initialize(hash)
    super
    raise 'found change event with more than one item' unless @hash['items'].count <= 1
  end

end
