class FeedsController < ApplicationController
  
  def index
    @feeds = Feed.all
    @feed = Feed.find(params[:id])
    @entries = @feed.entries
    authorize @feeds
  end

  def show
    @feed = Feed.find(params[:id])
    @entry = @feed.entries
    @title = @feed.feed_title
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
    @feed = Feed.new(feed_params)
    authorize @feed

    if @feed.save
      flash[:notice] = "feed was saved."
      redirect_to feeds_path
    else
      flash[:error] = "There was an error saving your feed. Please try again."
      render :new
    end
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    @entry = @feed.entries

    if @feed.update(feed_params)
      flash[:notice] = "Feed was updated."
      redirect_to @feed
    else
      flash[:error] = "There was an error, please try again."
      redirect_to @feed
    end
  end

  def destroy
    @feed = Feed.find(params[:id])

    if @feed.destroy
      flash[:notice] = "Feed was deleted."
      redirect_to @feed
    else
      flash[:error] = "There was an error please try again."
      redirect_to @feed
    end
  end

  private

    def feed_params
      params.require(:feed).permit(:name, :url)
    end

end
