require 'attr_init'
require 'subscriptor_client/entities_client'

module SubscriptorClient
  class Base
    reader_struct :config

    def entities
      @entities ||= EntitiesClient.new(config)
    end
  end
end
