class Item < ActiveRecord::Base

  belongs_to :feed
  belongs_to :list

  default_scope { order('created_at DESC') }



 

  private

    # def self.add_items(items)
    #   items.each do |item|
    #     unless exists? guid: item.id
    #       create!(
    #         title:        item.title,
    #         summary:      item.summary,
    #         url:          item.url,
    #         published_at: item.published,
    #         guid:         item.entry_id
    #       )
    #     end
    #   end
    # end
end
