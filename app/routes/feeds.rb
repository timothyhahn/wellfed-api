module Wellfed
  module Routes
    class Feeds < Sinatra::Application
      get '/feeds/?' do
        "Hello, noob"
      end
    end
  end
end
