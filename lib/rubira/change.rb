# frozen_string_literal: true

module Rubira
  # Model for changes within change logs.  Used within `ChangeEvent`.
  class Change < BaseModel
    # Other attributes: fieldtype, fieldId, from, to
    attribute :field
    attribute :field_type, key: 'fieldType'
    attribute :field_id,   key: 'fieldId'
    attribute :from,       key: 'fromString'
    attribute :to,         key: 'toString'
    attribute :from_id,    key: 'from'
    attribute :to_id,      key: 'to'
  end
end
