require 'attr_init'
require 'subscriptor_client/entities_client'
require 'subscriptor_client/subscriptions_client'

module SubscriptorClient
  class Base
    reader_struct :config

    def entities
      @entities ||= EntitiesClient.new(config)
    end

    def subscriptions
      @subscriptions ||= SubscriptionsClient.new(config)
    end
  end
end
