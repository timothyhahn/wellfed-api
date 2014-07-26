require 'rubygems'
require 'bundler'

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)

# Require base
require 'sinatra/base'

require 'app/models'
require 'app/helpers'
require 'app/routes'


module Wellfed
  class App < Sinatra::Application

    configure do
      disable :method_override
      disable :static
      
      MongoMapper.connection = Mongo::Connection.new('localhost', 27017)
      MongoMapper.database = 'wellfed'

      set :sessions,
          httponly: true,
          secure: production?,
          secure: false,
          expire_after: 31557600,
          secret: 'SECRET'
    end

    use Rack::Deflater
    use Rack::Standards

    # Other routes:
    use Routes::Feeds
  end
end

include Wellfed::Models

