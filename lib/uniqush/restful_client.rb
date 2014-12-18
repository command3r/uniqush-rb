require "rest-client"

module Uniqush
  class RestfulClient
    ENDPOINTS = {
      version: [:get, "version"],
      stop: [:post, "stop"],
      add_service: [:post, "push_service_providers"],
      remove_service: [:delete, "push_service_providers"],
      subscribe_device: [:post, "subscribers"],
      unsubscribe_device: [:delete, "subscribers"],
      push: [:post, "push"]
    }.freeze

    def initialize(base_url)
      @client = rest_client(base_url)
    end

    ENDPOINTS.each do |method, (http_method, url)|
      define_method method do |params = {}, extras = {}|
        if [:post, :put, :patch].include?(http_method)
          args = [params.to_json, extras]
        else
          args = [{params: params}.merge(extras)]
        end
        @client[url].send(http_method, *args)
      end
    end

    def rest_client(url)
      RestClient::Resource.new(url)
    end
  end
end
