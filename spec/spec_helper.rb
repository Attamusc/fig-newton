require "fakefs/spec_helpers"

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers
end
