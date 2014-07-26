module Wellfed 
  module Models
    class FeedItem
      include MongoMapper::Document
      key :title,   String
      key :summary, String
      key :content, String
      key :read,    Boolean
      key :url,     String
      belongs_to :feeds
    end
  end
end