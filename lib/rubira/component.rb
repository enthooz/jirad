# frozen_string_literal: true

module Jirad
  # Model for components.
  class Component < BaseModel
    attribute :name
    alias to_s name
  end
end
