class ListsController < ApplicationController
  def index
    @lists = current_user.lists
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    @list.save
    redirect_to lists_path
  end

  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy!
    redirect_to lists_path
  end
  
  private

  def list_params
    params.require(:list).permit(:name, :agreement)
  end
end
