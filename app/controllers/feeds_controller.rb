class FeedsController < ApplicationController
  
  def index
    @feeds = Feed.all
  end

  def show
    @feed = Feed.find(params[:id])
    @entries = @feed.fetch_entries
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new

    if @feed.save
      flash[:notice] = "feed was saved."
      redirect_to feeds_path
    else
      flash[:error] = "There was an error saving your feed. Please try again."
      render :new
    end
  end


end
