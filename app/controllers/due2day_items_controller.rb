class Due2dayItemsController < ApplicationController
  before_action :set_due2day_list
  before_action :set_due2day_item, except: [:create]
def create
  # @due2day_list = Due2dayList.find(params[:due2day_list_id])
  @due2day_item = @due2day_list.due2day_items.create(due2day_item_params)

  redirect_to @due2day_list
end

def destroy
  # @due2day_item = @due2day_list.due2day_items.find(params[:id]) #before action set
  if @due2day_item.destroy
    flash[:success] = "Due list item deleted."
  else
    flash[:error] = "Due list item couldn't be removed."
  end
  redirect_to @due2day_list
end

def complete
  @due2day_item.update_attribute(:completed_at, Time.now)
  redirect_to @due2day_list, notice: "Due item Completed"
end

  private

  def set_due2day_list
    @due2day_list = Due2dayList.find(params[:due2day_list_id])
  end

  def set_due2day_item
    @due2day_item = @due2day_list.due2day_items.find(params[:id])
  end

  def due2day_item_params
    params[:due2day_item].permit(:content)
  end


end
