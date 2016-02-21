class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, except: [:create]

def create
  @item = @list.items.create(item_params)
  redirect_to @list
end

def destroy
  if @item.destroy
    flash[:success] = "Due list item deleted."
  else
    flash[:error] = "Due list item couldn't be removed."
  end
  redirect_to @list
end

def complete
  @item.update_attribute(:completed_at, Time.now)
  redirect_to @list, notice: "Due item Completed"
end


  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params[:item].permit(:content)
  end
end
