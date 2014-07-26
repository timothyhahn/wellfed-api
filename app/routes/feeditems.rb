module Wellfed
  module Routes
    class FeedItems < Sinatra::Application
      # All Feeds
      get '/feeditems/?' do
        FeedItem.all().to_json()
      end

      post '/feeditems/?' do
        title = params[:title]
        summary = params[:summary]
        url = params[:url]
        FeedItem.create(:title => title, :summary => summary, :url => url, :updated_at => Time.now).to_json()
      end

      delete '/feeditems/?' do
        FeedItem.delete_all().to_json()
      end

      # Specific Feed
      get '/feeditems/:feed_item_id' do
        feed_item_id = params[:feed_item_id]
        FeedItem.all(:id => feed_item_id).to_json()
      end

      put '/feeditems/:feed_item_id' do
        feed_item_id = params[:feed_item_id]
        title = params[:title]
        summary = params[:summary]
        url = params[:url]
        FeedItem.update(feed_item_id, :title => title, :summary => summary, :url => url, :updated_at => Time.now)
      end

      delete '/feeditems/:feed_item_id' do
        feed_item_id = params[:feed_item_id]
        FeedItem.destroy(feed_item_id)
      end
    end
  end
end
