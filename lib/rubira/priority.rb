# frozen_string_literal: true

module Jirad
  # Model for priority.
  class Priority < BaseModel
    attribute :name
    alias to_s name
  end
end
