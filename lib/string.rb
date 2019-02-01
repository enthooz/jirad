class String
  def symbolize
    return self unless /[A-Z\s-]/.match?(self)
    word = self.gsub(/[^a-z0-9\s]/i, ''.freeze)
    word.gsub!(/\s+/, '_'.freeze)
    word.tr!("-".freeze, "_".freeze)
    word.downcase!
    word.to_sym
  end
end
