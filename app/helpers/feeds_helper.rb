module FeedsHelper

  def get_info(entry)
    entry.summary || entry.content
  end

end
