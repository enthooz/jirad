# frozen_string_literal: true

module FactoryHelper
  FACTORY_DIR = File.join(File.dirname(__dir__), 'factories')

  def self.define(name, options = {}, &block)
    raise "#{name} factory already defined" if @factories.key?(name)
    raise 'block missing' unless block_given?

    @factories[name] = Factory.new(name, options, block)
  end

  def self.find_definitions
    @factories ||= {}
    Dir[File.join(FACTORY_DIR, '**', '*.rb')].sort.each do |file|
      load file
    end
  end

  def self.build_from(name)
    @factories[name].build
  end

  def self.clear_factories!
    @factories = {}
  end

  def build(name)
    FactoryHelper.build_from(name)
  end

  class Factory
    def initialize(name, options, block)
      @name    = name
      @options = options
      @block   = block
    end

    def build
      @result ||= @block.call
      process_inheritance
      @result
    end

    protected

    def parent
      @parent ||= @options[:parent]
    end

    def process_inheritance
      @inheritance_processed ||= false
      return if @inheritance_processed

      unless parent.nil?
        @result = FactoryHelper.build_from(parent).merge(@result)
      end
      @inheritance_processed = true
    end
  end
end
