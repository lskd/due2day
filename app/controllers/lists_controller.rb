class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # Squashing InvalidForeignKey Error due to list deletes with items inside
  # rescue_from 'ActiveRecord::InvalidForeignKey' do
  # flash[:notice] = "Remove Items before Due List will delete."
  # redirect_to @list
  # end

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
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'Due 2 day list updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
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
        format.json { head :no_content }
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
