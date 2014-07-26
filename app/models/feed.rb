module Wellfed 
  module Models
    class Feed
      include MongoMapper::Document
      key :title,        String
      key :url,          String
      key :updated_at,   Time
      key :latest_title, String
      belongs_to  :categorys
      many :feed_items
    end
  end
end
