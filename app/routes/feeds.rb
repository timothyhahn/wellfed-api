module Wellfed
  module Routes
    class Feeds < Sinatra::Application
      get '/feeds/?' do
        Feed.all().to_json()
      end

      post '/feeds/?' do
        title = params[:title]
        url = params[:url]
        Feed.create(:title => title, :url => url, :updated_at => Time.now)
      end

      delete '/feeds/?' do
        Feed.delete_all().to_json()
      end

    end
  end
end
