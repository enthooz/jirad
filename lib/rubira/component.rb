# frozen_string_literal: true

module Rubira
  # Model for components.
  class Component < BaseModel
    attribute :name
    alias to_s name
  end
end
