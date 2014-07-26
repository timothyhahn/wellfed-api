require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$LOAD_PATH << File.expand_path('../', __FILE__)

# Require base
require 'sinatra/base'

require 'app/models'
require 'app/helpers'
require 'app/routes'

module Wellfed
  # Main Sinatra Application
  class App < Sinatra::Application
    configure do
      disable :method_override
      disable :static

      MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
      MongoMapper.database = 'wellfed'

      set :sessions,
          :httponly => true,
          :secure => false,
          :expire_after => 31_557_600,
          :secret => 'SECRET'
    end

    use Rack::Deflater
    use Rack::Standards

    # Other routes:
    use Routes::Feeds
    use Routes::FeedItems
  end
end

include Wellfed::Models
include Wellfed::Helpers

