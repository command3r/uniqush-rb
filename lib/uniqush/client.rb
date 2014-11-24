require "rest-client"

module Uniqush
  class Client
    ENDPOINTS = {
      version: "version",
      stop: "stop",
      add_service: "addpsp",
      remove_service: "rmpsp",
      subscribe_device: "subscribe",
      unsubscribe_device: "unsubscribe",
      push: "push"
    }.freeze


    def initialize(base_url)
      @client = rest_client(base_url)
    end

    ENDPOINTS.each do |method, url|
      define_method method do |params = {}|
        @client[url].get(params: params)
      end
    end

    def rest_client(url)
      RestClient::Resource.new(url)
    end
  end
end
