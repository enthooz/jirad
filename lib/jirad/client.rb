# frozen_string_literal: true

class Jirad::Client
  # TODO: use Net::HTTP
  include HTTParty

  # TODO: better initialization
  # TODO: use JIRA REST v3 (https://developer.atlassian.com/cloud/jira/platform/rest/v3/)
  def initialize(options)
    @options = options
    @auth    = { username: @options[:username], password: @options[:password] }
    @site    = @options[:site]
  end

  # TODO: better error handling
  def get(path, options = {})
    options = build_options(options)
    url     = build_url(path)
    response = self.class.get(url, options)
    JSON.parse(response.body)
  end

  protected

  def build_options(options = {})
    options.merge(basic_auth: @auth)
  end

  def build_url(path)
    "#{@options[:site]}/rest/api/2/#{path}"
  end
end
