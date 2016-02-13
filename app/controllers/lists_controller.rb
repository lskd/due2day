class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # Squashing InvalidForeignKey Error due to list deletes with items inside
  # rescue_from 'ActiveRecord::InvalidForeignKey' do
  # flash[:notice] = "Remove Items before Due List will delete."
  # redirect_to @list
  # end

  # GET /lists
  # GET /lists.json
  def index
    @lists = Due2dayList.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = Due2dayList.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = Due2dayList.new(list_params)

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

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
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

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    if @list.due2day_items.any?
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
      @list = Due2dayList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :description)
    end
end
