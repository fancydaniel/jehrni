class ItemsController < ApplicationController

  def index
    @items = Item.all
    authorize @items
  end

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @item = Item.new 
    authorize @items
  end 

  def create
    @list = List.find(params[:list_id])
    @item = Item.new_with_preview(item_params)
    @item.list = @list
  
    authorize @item

    if @item.save
      flash[:notice] = "Item was saved"
      redirect_to @list
    else
      flash[:error] = "There was an error saving your item. Please try again."
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    if @item.update_attributes(item_params)
      flash[:notice] = "Your item was successfully updated."
      redirect_to @list
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted."
      redirect_to @list
    else
      flash[:error] = "There was an error removing the item. Please try again."
      redirect_to @item
    end
  end

  private
    def item_params
       params.require(:item).permit(:url) 
    end

end
