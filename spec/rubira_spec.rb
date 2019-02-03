# frozen_string_literal: true

require 'rubira'

RSpec.describe Rubira do
  it 'version is set' do
    expect(Rubira::VERSION).not_to be_empty
  end
end
