module Wellfed
  module Routes
    # Base Route with some defaults added
    class Base < Sinatra::Application
      configure do
        set :root, App.root

        disable :method_override
        disable :protection
        disable :static

        enable :use_code
      end
      before do
        content_type :json    
        headers 'Access-Control-Allow-Origin' => '*'
      end

      helpers Helpers
    end
  end
end
