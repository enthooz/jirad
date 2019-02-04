# frozen_string_literal: true

# Adds helpful methods to standard `String` class.
class String
  def symbolize
    return self unless /[A-Z\s-]/.match?(self)

    word = gsub(/[^a-z0-9\s]/i, '')
    word.gsub!(/\s+/, '_')
    word.tr!('-', '_')
    word.downcase!
    word.to_sym
  end

  def underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end
end
