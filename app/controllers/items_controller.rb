class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Items.find(params[:id])
  end

  def new
    @item = Item.new 
  end 

  def create
  end
end
