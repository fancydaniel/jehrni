class SavedEntry < ActiveRecord::Base
  validates :url, presence: true

  belongs_to :list

  def self.new_with_preview(params)
    saved_entry = new(params)
    preview = PreviewService.new(params[:url])
    saved_entry.image_url = preview.image_url
    saved_entry
  end

  # def image_url
  #   PreviewService.new(url).image_url
  # end

end
