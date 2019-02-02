# frozen_string_literal: true

class Jirad::Component < Jirad::BaseModel
  attribute :name
  alias to_s name
end
