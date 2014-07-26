module Wellfed
  # Sinatra Routes
  module Routes
    # Base Routes:
    autoload :Base, 'app/routes/base'

    # Other Routes:
    autoload :Feeds, 'app/routes/feeds'
    autoload :FeedItems, 'app/routes/feeditems'
  end
end
