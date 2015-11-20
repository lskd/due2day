class Due2dayItemsController < ApplicationController
  before_action :set_due2day_list

def create
  # @due2day_list = Due2dayList.find(params[:due2day_list_id])
  @due2day_item = @due2day_list.due2day_items.create(due2day_item_params)

  redirect_to @due2day_list
end

def destroy
  @due2day_item = @due2day_list.due2day_items.find(params[:id])
  if @due2day_item.destroy
    flash[:success] = "Due list item deleted."
  else
    flash[:error] = "Due list item couldn't be removed."
  end
  redirect_to @due2day_list
end


  private

  def set_due2day_list
    @due2day_list = Due2dayList.find(params[:due2day_list_id])
  end


  def due2day_item_params
    params[:due2day_item].permit(:content)
  end


end
