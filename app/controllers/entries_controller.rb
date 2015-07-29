class EntriesController < ApplicationController

  def create
    @list = List.find(params[:list])
    @saved_entry = SavedEntry.new_with_preview(url: params[:url])
    @saved_entry.list = @list
    @saved_entry.save
    redirect_to request.referer
  end

  def edit
    @list = List.find(params[:list_id])
    @saved_entry = SavedEntry.find(params[:id])
  end

  def update
    @saved_entry = SavedEntry.find(params[:id])

    if @saved_entry.update_attributes(url: params[:url])
      flash[:notice] = "You have updated the entry."
      redirect_to @list
    else
      flash[:notice] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @saved_entry = SavedEntry.find(params[:id])
  end

  private



end
