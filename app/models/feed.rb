module Wellfed 
  module Models
    class Feed
      include MongoMapper::Document
      key :title,      String
      key :url,        String
      key :updated_at, Time
      belongs_to  :categorys
    end
  end
end
