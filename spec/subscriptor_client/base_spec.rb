require 'spec_helper'
require 'rspec/collection_matchers'
require 'subscriptor_client'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

describe SubscriptorClient::Base do
  pending 'add specs'
end
