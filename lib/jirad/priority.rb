class Jirad::Priority < Jirad::BaseModel
  attribute :name
  alias_method :to_s, :name
end
