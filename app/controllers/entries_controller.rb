class EntriesController < ApplicationController

  def create
    @list = List.find(params[:list])
    @saved_entry = SavedEntry.new(url: params[:url])
    @saved_entry.list = @list
    @saved_entry.save
    redirect_to request.referer
  end

end
