module Wellfed 
  module Models
    class Feeds
      include MongoMapper::Document
      key :title,      String
      key :url,        String
      key :updated_at, Time
    end
  end
end
