# frozen_string_literal: true

module Rubira
  # Provides syntactic sugar for quickly defining Extend this class when
  # creating models.
  class BaseModel
    def initialize(hash)
      @hash = hash
    end

    def attributes
      self.class.attributes
    end

    class << self
      def attributes
        @attributes ||= []
      end

      protected

      def person(attribute, key: nil)
        instantiated_attribute(attribute, key, Rubira::Person)
      end

      def timestamp(attribute, key: nil)
        instantiated_attribute(attribute, key, Rubira::Timestamp, :parse)
      end

      def attribute(attribute, key: nil, type: nil)
        add_attribute(attribute)
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

      def add_attribute(attribute)
        @attributes ||= []
        @attributes << attribute unless @attributes.include?(attribute)
      end

      # TODO: consolidate `instantiated_attribute` and `instantiated_collection`
      def instantiated_attribute(attribute, key, type, constructor = :new)
        add_attribute(attribute)
        var_name = :"@#{attribute.to_s}"
        key = attribute.to_s if key.nil?
        define_method(attribute) do
          return instance_variable_get(var_name) if
            instance_variable_defined?(var_name)

          object = @hash.dig(*key)
          object = type.send(constructor, object) unless object.nil?
          instance_variable_set(var_name, object)
        end
      end

      def instantiated_collection(attribute, key, type, constructor = :new)
        add_attribute(attribute)
        var_name = :"@#{attribute.to_s}"
        key = attribute.to_s if key.nil?
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
