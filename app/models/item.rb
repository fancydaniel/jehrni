class Item < ActiveRecord::Base

  belongs_to :feed

  def self.create_entry_from_feed(entry)
    new_entry = Entry.new(
      title: entry.title,
      content: summary(entry),
      published: entry.published_at,
      url: entry.url
      )
    new_entry
  end

  def download_all_entries!
    Feedjira::Feed.fetch_and_parse(
      url,
      on_success: download_success,
      on_failure: download_failure
      )
  end

  def download_success
    lambda { |url, feed|
      feed.entries.each do |entry|
      add_new_entry_from_feed(entry)
    end
    }
  end

  def download_failure
    lambda { curl, err|
      logger.error "Downloading #{curl} failed due to #{error}"
    }
  end

  def add_new_entry_from_feed(entry)
    db_entry = Entry.create_entry_from_feed(entry)
    db_entry.blog_id = id                         # Change to my id (likely feed or list)
    db_entry.save
  end

  def update_feed!
    @newest_entry = entries.order(published: :desc).first
    download_success_date = lambda{ |url, feed|
      next unless !@newest_entry || entry.published > @newest_entry.published
      add_new_entry_from_feed(entry)
    }
    Feedjira::Feed.fetch_and_parse(
      url,
      on_success: download_success_date,
      on_failure: download_failure
      )
  end
end
