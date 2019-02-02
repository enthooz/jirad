# frozen_string_literal: true

module Jirad
  # Provides syntactic sugar for quickly defining Extend this class when
  # creating models.
  class BaseModel
    def initialize(hash)
      @hash = hash
    end

    class << self
      protected

      def person(attribute, key: nil)
        instantiated_attribute(attribute, key, Jirad::Person)
      end

      def timestamp(attribute, key: nil)
        instantiated_attribute(attribute, key, Jirad::Timestamp, :parse)
      end

      def attribute(attribute, key: nil, type: nil)
        key = attribute.to_s if key.nil?
        if type.nil?
          define_method attribute do
            @hash.dig(*key)
          end
        else
          instantiated_attribute(attribute, key, type)
        end
      end

      def collection(attribute, key: nil, type: nil)
        raise 'non-instantiated collections not yet supported' if type.nil?

        key = attribute.to_s if key.nil?
        instantiated_collection(attribute, key, type)
      end

      private

      # TODO: consolidate `instantiated_attribute` and `instantiated_collection`
      def instantiated_attribute(attribute, key, type, constructor = :new)
        var_name = :"@#{attribute.to_s}"
        define_method(attribute) do
          return instance_variable_get(var_name) if
            instance_variable_defined?(var_name)

          object = @hash.dig(*key)
          object = type.send(constructor, object) unless object.nil?
          instance_variable_set(var_name, object)
        end
      end

      def instantiated_collection(attribute, key, type, constructor = :new)
        var_name = :"@#{attribute.to_s}"
        define_method(attribute) do
          return instance_variable_get(var_name) if
            instance_variable_defined?(var_name)

          collection = @hash.dig(*key).collect do |item|
            type.send(constructor, item)
          end
          instance_variable_set(var_name, collection)
        end
      end
    end
  end
end
