class Feed < ActiveRecord::Base

  has_many :items


  def entries(num = 3)
    feed = Feedjira::Feed.fetch_and_parse(url)
    feed.entries.take(num)
    # feed.url
    # add_items(feed.entries)  # Saving items to database
  end

  def self.update_from_feed_continuously(url, delay_interval = 30.minutes)
    feed = Feedjira::Feed.fetch_and_parse(url)
    add_items(feed.items)
    loop do
      sleep delay_interval
      feed = Feedjira::Feed.update(feed)
      add_entries(feed.new_entries) if feed.updated?
    end
  end

end
