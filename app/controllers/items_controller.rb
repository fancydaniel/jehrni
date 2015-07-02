class ItemsController < ApplicationController

  def index
    @items = Item.all
    authorize @items
  end

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def new
      @list = List.find(params[:list_id])
    @item = Item.new 
    authorize @items
  end 

  def create
    @list = List.find(params[:list_id])

    @item = Item.new
    # @item.list = @item
    authorize @item

    if @item.save
      flash[:notice] = "Item was saved"
      redirect_to list_path
    else
      flash[:error] = "There was an error saving your item. Please try again."
      render :new
    end
  end


  end
end
