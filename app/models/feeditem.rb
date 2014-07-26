module Wellfed
  module Models
    class FeedItem
      include MongoMapper::Document
      key :title,   String
      key :description, String
      key :content, String
      key :unread,    Boolean
      key :url,     String
      belongs_to :feeds
      def unread?
        puts 'hi'
        :unread
      end
    end
  end
end
