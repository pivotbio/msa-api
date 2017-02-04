require './app.rb'

ENV['RACK_ENV'] = 'test'

Bundler.require :test

RSpec.configure do |config|
  def app
    MSAAPI
  end
  config.include Rack::Test::Methods
end
