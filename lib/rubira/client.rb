# frozen_string_literal: true

module Jirad
  # Used to handle HTTP requests to the JIRA REST API.
  class Client
    # TODO: use Net::HTTP
    include HTTParty

    # TODO: better initialization
    # TODO: use JIRA REST v3 (https://developer.atlassian.com/cloud/jira/platform/rest/v3/)
    def initialize(options)
      @options = options
      @auth = { username: @options[:username], password: @options[:password] }
      @site = @options[:site]
    end

    # TODO: better error handling
    def get(path, options = {})
      options = build_options(options)
      url     = build_url(path)
      response = self.class.get(url, options)
      JSON.parse(response.body)
    end

    def paginate(path, options = {}, limit = 1000)
      options = build_pagination_options(options)
      while pagination_total(options) <= limit
        response = Jirad.client.get(path, options)
        yield response
        options[:query][:startAt] = pagination_total(options)
        break if options[:query][:startAt] >= response['total']
      end
    end

    protected

    def build_options(options = {})
      options.merge(basic_auth: @auth)
    end

    def build_url(path)
      "#{@options[:site]}/rest/api/2/#{path}"
    end

    def build_pagination_options(options = {})
      options[:query] ||= {}
      options[:query].merge!(startAt: 0, maxResults: 50)
      options
    end

    def pagination_total(options)
      options[:query][:startAt] + options[:query][:maxResults]
    end
  end
end
