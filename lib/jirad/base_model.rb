class Jirad::BaseModel
  def initialize(hash)
    @hash = hash
  end

  protected

  def self.person(attribute, key: nil)
    attribute(attribute, key: key, type: Jirad::Person)
  end

  def self.timestamp(attribute, key: nil)
    attribute(attribute, key: key, type: Jirad::Timestamp, constructor: :parse)
  end

  def self.attribute(attribute, key: nil, type: nil, constructor: nil)
    key = attribute.to_s if key.nil?
    if type.nil?
      define_method attribute do
        @hash.dig(*key)
      end
    else
      instantiated_attribute(attribute, key, type, constructor)
    end
  end

  def self.collection(attribute, key: nil, type: nil)
    key = attribute.to_s if key.nil?
    if type.nil?
      raise 'non-instantiated collections not yet supported'
    else
      instantiated_collection(attribute, key, type)
    end
  end

  private

  # TODO: consolidate `instantiated_attribute` and `instantiated_collection`
  def self.instantiated_attribute(attribute, key, type, constructor)
    var_name = :"@#{attribute.to_s}"
    define_method(attribute) do
      if instance_variable_defined?(var_name)
        instance_variable_get(var_name)
      else
        value = @hash.dig(*key)
        object = nil
        if !value.nil?
          constructor ||= :new
          object = type.send(constructor, value)
        end
        instance_variable_set(var_name, object)
      end
    end
  end

  def self.instantiated_collection(attribute, key, type)
    var_name = :"@#{attribute.to_s}"
    define_method(attribute) do
      if instance_variable_defined?(var_name)
        instance_variable_get(var_name)
      else
        object = @hash.dig(*key).collect { |item| type.new(item) }
        instance_variable_set(var_name, object)
      end
    end
  end

end
