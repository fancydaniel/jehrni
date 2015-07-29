class Item < ActiveRecord::Base
  belongs_to :list

  validates :url, presence: true

  acts_as_taggable 
  acts_as_taggable_on :item

  default_scope { order('created_at DESC') }

  def self.new_with_preview(params)
    item = new(params)
    preview = PreviewService.new(params[:url])
    item.image_url = preview.image_url
    item
  end
end
