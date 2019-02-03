# frozen_string_literal: true

module Rubira
  # Model for timestamps.  Mostly just provides `#to_s`.
  class Timestamp < DateTime
    def to_s
      strftime('%Y-%m-%d %H:%M:%S %Z')
    end
  end
end
