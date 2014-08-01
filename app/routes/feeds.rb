module Wellfed
  module Routes
    class Feeds < Base
      get '/update/?' do
        FeedUpdater.update_all
      end
      # All Feeds
      get '/feeds/?' do
        Feed.all.to_json(:methods => [:unread_feed_item_count, :total_feed_item_count])
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

      get '/feeds/all/?' do
        all_feed_items = Feed.all.map{|feed| feed.feed_items}.flatten
        feed_items = all_feed_items.map{|feed_item| {:title => feed_item.title,
                                                     :unread => feed_item.unread,
                                                     :content => feed_item.content,
                                                     :description => feed_item.description,
                                                     :url => feed_item.url,
                                                     :id => feed_item.id}}
        all_feeds = {:title => "All",
                     :unread_feed_item_count => all_feed_items.length,
                     :total_feed_item_count => all_feed_items.length,
                     :feed_items => feed_items}

        ## Get all unread feed_items from feeds,
        ## Organize bysome timestamp
        JSON.generate(all_feeds)
      end

      # Specific Feed
      get '/feeds/:feed_id' do
        feed_id = params[:feed_id]
        Feed.all(:id => feed_id).first.to_json(:include => [:feed_items],
                                               :methods => [:unread_feed_item_count,
                                                            :total_feed_item_count])
      end

      get '/feeds/:feed_id/unread/?' do
        feed_id = params[:feed_id]
        Feed.all(:id => feed_id).first.to_json(:methods => [:unread_feed_items,
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
