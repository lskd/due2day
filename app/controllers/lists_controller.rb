class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def edit
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Due 2 day list created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Due 2 day list updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @list.items.any?
      flash[:notice] = "[ •  Remove Items from Due List First • ]"
      redirect_to @list
    else
    @list.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Due 2 day list destroyed.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :description)
    end
end
