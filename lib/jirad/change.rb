# frozen_string_literal: true

module Jirad
  # Model for changes within change logs.  Used within `ChangeEvent`.
  class Change < BaseModel
    # Other attributes: fieldtype, fieldId, from, to
    attribute :field
    attribute :from, key: 'fromString'
    attribute :to,   key: 'toString'

    def initialize(hash)
      super
      raise 'found change event with more than one item' if
        @hash['items'].count > 1
    end
  end
end
