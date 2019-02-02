# frozen_string_literal: true

class String
  def symbolize
    return self unless /[A-Z\s-]/.match?(self)

    word = gsub(/[^a-z0-9\s]/i, '')
    word.gsub!(/\s+/, '_')
    word.tr!('-', '_')
    word.downcase!
    word.to_sym
  end
end
