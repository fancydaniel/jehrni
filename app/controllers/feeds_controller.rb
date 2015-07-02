class FeedsController < ApplicationController
  
  def index
    @feeds = Feed.all
    authorize @feeds
  end

  def show
    @feed = Feed.find(params[:id])
    authorize @feed

    if params[:amount]
      @entries = @feed.entries(params[:amount].to_i)
    else
      @entries = @feed.entries(3)
    end
  end

  def new
    @feed = Feed.new
    authorize @feed
  end

  def create
    @feed = Feed.new(params.require(:feed).permit(:name, :url))
    authorize @feed

    if @feed.save
      flash[:notice] = "feed was saved."
      redirect_to feeds_path
    else
      flash[:error] = "There was an error saving your feed. Please try again."
      render :new
    end
  end


end
