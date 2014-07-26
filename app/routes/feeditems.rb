module Wellfed
  module Routes
    # Representation of an item belonging to a Feed
    class FeedItems < Sinatra::Application
      # All Feeds
      get '/feeditems/?' do
        FeedItem.all.to_json
      end

      post '/feeditems/?' do
        title = params[:title]
        summary = params[:summary]
        url = params[:url]
        feed = FeedItem.create(:title => title,
                               :summary => summary,
                               :url => url,
                               :updated_at => Time.now)
        feed.to_json
      end

      delete '/feeditems/?' do
        FeedItem.delete_all.to_json
      end

      # Specific Feed
      get '/feeditems/:feed_item_id' do
        feed_item_id = params[:feed_item_id]
        FeedItem.all(:id => feed_item_id).to_json
      end

      put '/feeditems/:feed_item_id' do
        feed_item_id = params[:feed_item_id]
        feed_item = FeedItem.update(feed_item_id,
                                    :unread => false,
                                    :updated_at => Time.now)
        feed_item.to_json
      end

      delete '/feeditems/:feed_item_id' do
        feed_item_id = params[:feed_item_id]
        FeedItem.destroy(feed_item_id)
      end
    end
  end
end
