require 'subscriptor_client/version'
require 'subscriptor_client/base'

module SubscriptorClient
    @@configs = {}
    @@stubbed_params = nil

    def self.register_config(key, config)
      @@configs[key] = config
    end

    def self.new(key)
      Base.new(config: @@configs[key])
    end

    def self.configs
      @@configs
    end

    def self.reset!
      @@stubbed_params = nil
    end

    def self.authenticate_with!(account)
      @@stubbed_params = account
    end
end
