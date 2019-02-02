# frozen_string_literal: true

class Jirad::Timestamp < DateTime
  def new(time_string)
    parse(time_string)
  end

  def to_s
    strftime('%Y-%m-%d %H:%M:%S %Z')
  end
end
