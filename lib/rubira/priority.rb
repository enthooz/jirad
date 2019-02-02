# frozen_string_literal: true

module Rubira
  # Model for priority.
  class Priority < BaseModel
    attribute :name
    alias to_s name
  end
end
