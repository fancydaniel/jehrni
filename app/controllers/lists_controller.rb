class ListsController < ApplicationController

  def index
    if params[:public].present?
      @lists = List.where(public: true)
    else
      @lists = policy_scope(List)
    end
    authorize @lists
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @new_item = Item.new
    @saved_entries = @list.saved_entries
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    authorize @list
    
    if @list.save
      flash[:notice] = "List was saved"
      redirect_to lists_path
    else
      flash[:error] = "There was an error saving your list. Please try again."
      redirect_to lists_path
     end
  end

  def edit
    @list = List.find(params[:id])
    @saved_entry = @list.saved_entry # Added to try and get edit page to render
  end

  def update
    @list = List.find(params[:id])


    if @list.update(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error updating your list. Please try again."
      redirect_to @list
    end
  end

  def destroy
    @list = List.find(params[:id])
    @saved_entries = @list.saved_entries  # Added to try and delete saved_entry in show page

    
    if @list.destroy
      flash[:notice] = "List was deleted."
      redirect_to @list
    else
      flash[:error] = "There was error deleting your list. Please try again."
      redirect_to @list
    end
  end


  private

    def list_params
      params.require(:list).permit(:name, :public, :description)
    end
end
