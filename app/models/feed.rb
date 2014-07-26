module Wellfed
  module Models
    # The representation of a feed
    class Feed
      include MongoMapper::Document
      key :title,        String
      key :url,          String
      key :updated_at,   Time
      key :latest_title, String
      belongs_to :categorys
      many :feed_items 
      
      def unread_feed_items
        feed_items.find_all_by_unread(true)
      end

      def unread_feed_item_count
        unread_feed_items.length
      end

      def total_feed_item_count
        feed_items.length
      end
    end
  end
end

