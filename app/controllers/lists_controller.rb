class ListsController < ApplicationController

  def index
    @lists = policy_scope(List)
    authorize @lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
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
    authorize @list
  end

  def update
    @list = List.find(params[:id])
    authorize @list

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
      authorize @list
      
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
