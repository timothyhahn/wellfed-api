module Wellfed
  module Routes
    class Feeds < Sinatra::Application
      get '/feeds/?' do
        Feed.all().to_json()
      end

      post '/feeds/?' do
        title = params[:title]
        url = params[:url]
        feed = Feed.create(:title => title, :url => url, :updated_at => Time.now, :latest_title => "!UNMINED!")
      end

      delete '/feeds/?' do
        Feed.delete_all().to_json()
      end

    end
  end
end
