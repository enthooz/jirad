# frozen_string_literal: true

require 'pathname'

# TODO: use HTTParty in Rubira::Client

# Top namespace.  Provides easy access to client.
module Rubira
  @client = nil

  def self.client
    return @client unless @client.nil?

    options = {
      username: ENV['JIRA_USERNAME'],
      password: ENV['JIRA_PASSWORD'],
      site:     ENV['JIRA_SITE']
    }

    @client = Rubira::Client.new(options)
  end

  def self.root
    @root ||= Pathname.new(File.dirname(__dir__))
  end
end

require 'httparty'
require 'string'
require 'rubira/version'
require 'rubira/timestamp'
require 'rubira/base_model'
require 'rubira/change'
require 'rubira/client'
require 'rubira/person'
require 'rubira/issue_type'
require 'rubira/issue_status'
require 'rubira/priority'
require 'rubira/component'
require 'rubira/change_event'
require 'rubira/comment'
require 'rubira/work_event'
require 'rubira/base_issue'
require 'rubira/issue_link'
require 'rubira/issue'
