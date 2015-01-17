
require 'rest_client'
require 'json_client'

module SubscriptorClient
  class EntitiesClient < JsonClient::Base
    def initialize(config)
      super(
        JsonClient::Pather.new(config[:host], 'api/v1', 'entities'),
        config
      )
    end

    def create
      super({})
    end

    def update(*args)
      method_missing(:update, *args)
    end
  end
end
