module Wellfed 
  module Models
    class Category
      include MongoMapper::Document
      key :name,      String
      many :feeds
    end
  end
end
