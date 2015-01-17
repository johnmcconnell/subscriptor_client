require 'spec_helper'
require 'rspec/collection_matchers'

describe SubscriptorClient::Base do
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
    client.entities
  end

  describe '#index' do
    it 'returns all entities of the client' do
      VCR.use_cassette('index_success') do
        response = subject.index.json

        expect(response['entities']).to eq []
      end
    end
  end

  describe '#create' do
    it 'returns an entity of the client' do
      VCR.use_cassette('create_success') do
        response = subject.create.json

        expect(response['id']).to eq 1
        expect(response['created_at']).not_to be nil
      end
    end
  end

  describe '#show' do
    it 'returns an entity of the client' do
      VCR.use_cassette('show_success') do
        response = subject.show(1).json

        expect(response['id']).to eq 1
        expect(response['created_at']).not_to be nil
      end
    end
  end

  describe '#destroy' do
    it 'returns an entity of the client' do
      VCR.use_cassette('destroy_success') do
        response = subject.destroy(1).json

        expect(response['id']).to eq 1
      end
    end
  end
end
