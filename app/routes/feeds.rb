module Wellfed
  module Routes
    class Feeds < Sinatra::Application
      # All Feeds
      get '/feeds/?' do
        Feed.all.to_json(:methods => [:unread_feed_items, :total_feed_items])
      end

      post '/feeds/?' do
        title = params[:title]
        url = params[:url]
        Feed.create(:title => title,
                    :url => url,
                    :updated_at => Time.now,
                    :latest_title => '!UNMINED!').to_json
      end

      delete '/feeds/?' do
        Feed.delete_all.to_json
      end

      # Specific Feed
      get '/feeds/:feed_id' do
        feed_id = params[:feed_id]
        Feed.all(:id => feed_id).to_json(:include => [:feed_items],
                                         :methods => [:unread_feed_item_count,
                                                      :total_feed_item_count])
      end
      get '/feeds/:feed_id/unread/?' do
        feed_id = params[:feed_id]
        Feed.all(:id => feed_id).to_json(:methods => [:unread_feed_items,
                                                     :unread_feed_item_count,
                                                     :total_feed_item_count])
      end


      put '/feeds/:feed_id' do
        feed_id = params[:feed_id]
        title = params[:title]
        url = params[:url]
        Feed.update(feed_id,
                    :title => title,
                    :url => url,
                    :updated_at => Time.now).to_json
      end

      delete '/feeds/:feed_id' do
        feed_id = params[:feed_id]
        Feed.destroy(feed_id)
      end
    end
  end
end
