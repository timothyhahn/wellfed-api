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
        headers 'Access-Control-Allow-Origin' => '*',
                'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST', 'PUT', 'DELETE']
      end

      helpers Helpers
    end
  end
end
