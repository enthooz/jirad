# frozen_string_literal: true

class Jirad::Priority < Jirad::BaseModel
  attribute :name
  alias to_s name
end
