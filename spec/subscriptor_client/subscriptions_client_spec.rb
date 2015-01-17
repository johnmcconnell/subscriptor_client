require 'spec_helper'
require 'rspec/collection_matchers'

describe SubscriptorClient::SubscriptionsClient do
  let(:config) do
    {
      api_key: '5',
      api_password: 'subscriptor_test',
      host: 'http://subscriptor.herokuapp.com'
    }
  end

  let(:client) do
    SubscriptorClient.register_config(:test, config)
    SubscriptorClient.new(:test)
  end

  subject do
    client.subscriptions
  end

  let(:subscription_params) do
    {
      credits: 0, entity_id: 4
    }
  end

  describe '#index' do
    it 'returns all entities of the client' do
      VCR.use_cassette('subscriptions/index_success') do
        response = subject.index.json

        expect(response['subscriptions']).to eq []
      end
    end
  end

  describe '#create' do
    it 'returns an entity of the client' do
      VCR.use_cassette('subscriptions/create_success') do
        response = subject.create(subscription_params).json

        expect(response['id']).to eq 1
        expect(response['entity_id']).to eq subscription_params[:entity_id]
        expect(response['credits']).to eq subscription_params[:credits]

        expect(response['created_at']).not_to be nil
      end
    end
  end

  describe '#show' do
    it 'returns an entity of the client' do
      VCR.use_cassette('subscriptions/show_success') do
        response = subject.show(1).json

        expect(response['id']).to eq 1

        expect(response['created_at']).not_to be nil
      end
    end
  end

  describe '#add_credits' do
    it 'returns an entity of the client' do
      VCR.use_cassette('subscriptions/add_credits_success') do
        response = subject.add_credits(2, credits: 2).json

        expect(response['id']).to eq 2
        expect(response['credits']).to eq 4
      end
    end
  end

  describe '#remove_credits' do
    it 'returns an entity of the client' do
      VCR.use_cassette('subscriptions/remove_credits_success') do
        response = subject.remove_credits(2, credits: 2).json

        expect(response['id']).to eq 2
        expect(response['credits']).to eq 2
      end
    end
  end

  describe '#update' do
    it 'returns an entity of the client' do
      VCR.use_cassette('subscriptions/update_success') do
        response = subject.update(1, credits: 2).json

        expect(response['id']).to eq 1
        expect(response['credits']).to eq 2
      end
    end
  end

  describe '#destroy' do
    it 'returns an entity of the client' do
      VCR.use_cassette('subscriptions/destroy_success') do
        response = subject.destroy(1).json

        expect(response['id']).to eq 1
      end
    end
  end
end
