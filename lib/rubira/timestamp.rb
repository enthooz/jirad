# frozen_string_literal: true

module Rubira
  # Model for timestamps.  Mostly just provides `#to_s`.
  class Timestamp < DateTime
    def new(time_string)
      parse(time_string)
    end

    def to_s
      strftime('%Y-%m-%d %H:%M:%S %Z')
    end
  end
end
