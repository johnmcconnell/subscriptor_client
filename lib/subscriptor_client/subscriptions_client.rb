require 'rest_client'
require 'json_client'

module SubscriptorClient
  class SubscriptionsClient < JsonClient::Base
    requests do |r|
      r.on :index, use: JsonClient::BaseRequests::Index.new
      r.on :show, use: JsonClient::BaseRequests::Show.new
      r.on :create, use: JsonClient::BaseRequests::Create.new
      r.on :destroy, use: JsonClient::BaseRequests::Destroy.new
      r.on :update, :add_credits, :remove_credits,
        use: JsonClient::BaseRequests::Update.new
    end

    responses do |r|
      r.on :index, use: JsonClient::BaseResponses::Index
      r.on :show, use: JsonClient::BaseResponses::Show
      r.on :create, use: JsonClient::BaseResponses::Create
      r.on :destroy, use: JsonClient::BaseResponses::Destroy
      r.on :update, :add_credits, :remove_credits,
        use: JsonClient::BaseResponses::Update
    end

    serializers do |r|
      r.on :create, :update, :destroy, :add_credits, :remove_credits,
        use: JsonClient::ModelSerializer.new(model_name: 'subscription')
      r.on :index, :show,
        use: JsonClient::EmptySerializer.new
    end

    def initialize(config)
      super(
        JsonClient::Pather.new(config[:host], 'api/v1', 'subscriptions'),
        config
      )
    end

    def add_credits(id, params)
      request = requests.add_credits
      path = extended_path('add_credits', id)
      responses.add_credits.new(fetch(path, request, params))
    end

    def remove_credits(id, params)
      request = requests.add_credits
      path = extended_path('remove_credits', id)
      responses.add_credits.new(fetch(path, request, params))
    end

    protected

    def extended_path(ext, id = nil)
      "#{pather.path(id)}/#{ext}"
    end
  end
end
