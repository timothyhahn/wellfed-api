require 'simple-rss'
require 'open-uri'

module Wellfed
  module Helpers
    class FeedUpdater
      def FeedUpdater.update_all
        feeds = Feed.all()
        puts "Parsing #{feeds.length} feeds"
        feeds.each do |feed|
          ## Update Feed
          rss = SimpleRSS.parse open(feed.url)
          feed.updated_at = Time.now

          rss.items.each do |item|
            ## If we have already seen an item, we are at the end
            break if feed.latest_title.force_encoding("UTF-8").eql? item.title.force_encoding("UTF-8")

            ## Update Feed Items
            feed.feed_items.create(:feeds_id => feed.id, :title => item.title, :summary => item.summary, :content => item.content, :url => item.link, :read => false)
          end
          feed.latest_title = FeedItem.all.first.title
          feed.save
        end
      end
    end
  end
end

if __FILE__ == $0
  require File.expand_path('../..', __FILE__)
  Wellfed::Helpers::FeedUpdater.update_all
end
