module Wellfed
  module Routes
    autoload :Base, 'app/routes/base'

    # Other routes:
    autoload :Feeds, 'app/routes/feeds'
    autoload :FeedItems, 'app/routes/feeditems'
  end
end