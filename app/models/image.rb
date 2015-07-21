class Image < ActiveRecord::Base
  belongs_to :item
  belongs_to :entry

  attr_accessor :site_url

  def image(site_url)
    @image = LinkThumbnailer.generate(site_url)
  rescue LinkThumbnailer::BadURIFormat
    raise InvalidURLError
  end

  def image_url
    @image.images.first.src.to_s
  end

  def title
    @thumbnail.title
  end

end
