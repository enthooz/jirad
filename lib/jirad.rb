# frozen_string_literal: true

# TODO: use HTTParty in Jirad::Client

# Top namespace.  Provides easy access to client.
module Jirad
  @client = nil

  def self.client
    return @client unless @client.nil?

    options = {
      username: ENV['JIRA_USERNAME'],
      password: ENV['JIRA_PASSWORD'],
      site:     ENV['JIRA_SITE']
    }

    @client = Jirad::Client.new(options)
  end
end

require 'httparty'
require 'string'
require 'jirad/timestamp'
require 'jirad/base_model'
require 'jirad/change'
require 'jirad/client'
require 'jirad/person'
require 'jirad/issue_type'
require 'jirad/issue_status'
require 'jirad/priority'
require 'jirad/component'
require 'jirad/change_event'
require 'jirad/comment'
require 'jirad/work_event'
require 'jirad/base_issue'
require 'jirad/issue_link'
require 'jirad/issue'
