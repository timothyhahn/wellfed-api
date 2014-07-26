require 'simple-rss'
require 'open-uri'

module Wellfed
  module Helpers
    # Updates all feeds in the DB
    class FeedUpdater
      def self.update_item(feed, item)
        ## Update Feed Items
        feed.feed_items.create(:title => item.title,
                               :description => item.description,
                               :content => item.content,
                               :url => item.link,
                               :unread => true)
      end

      def self.update_feed(feed)
        ## Update Feed
        rss = SimpleRSS.parse open(feed.url)
        feed.updated_at = Time.now

        rss.items.each do |item| 
          ## If we have already seen an item, we are at the end
          ## These are to overcome any encoding issues
          latest_title = feed.latest_title.force_encoding('UTF-8')
          current_title = item.title.force_encoding('UTF-8')

          break if latest_title.eql? current_title

          self.update_item(feed, item)
        end

        feed.latest_title = FeedItem.all.first.title
        feed.save
      end

      def self.update_all
        feeds = Feed.all
        puts "Parsing #{feeds.length} feeds"
        feeds.each { |feed| self.update_feed(feed) }
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  require File.expand_path('../..', __FILE__)
  Wellfed::Helpers::FeedUpdater.update_all
end
