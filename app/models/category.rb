module Wellfed
  module Models
    # Categorization for Feeds
    class Category
      include MongoMapper::Document
      key :name,      String
      many :feeds
    end
  end
end
