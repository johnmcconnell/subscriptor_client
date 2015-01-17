require 'subscriptor_client'
require 'vcr'
require 'coveralls'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end

Coveralls.wear!

class SpecHelper
end

