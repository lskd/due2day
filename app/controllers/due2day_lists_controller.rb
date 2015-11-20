class Due2dayListsController < ApplicationController
  before_action :set_due2day_list, only: [:show, :edit, :update, :destroy]

  # GET /due2day_lists
  # GET /due2day_lists.json
  def index
    @due2day_lists = Due2dayList.all
  end

  # GET /due2day_lists/1
  # GET /due2day_lists/1.json
  def show
  end

  # GET /due2day_lists/new
  def new
    @due2day_list = Due2dayList.new
  end

  # GET /due2day_lists/1/edit
  def edit
  end

  # POST /due2day_lists
  # POST /due2day_lists.json
  def create
    @due2day_list = Due2dayList.new(due2day_list_params)

    respond_to do |format|
      if @due2day_list.save
        format.html { redirect_to @due2day_list, notice: 'Due2day list was successfully created.' }
        format.json { render :show, status: :created, location: @due2day_list }
      else
        format.html { render :new }
        format.json { render json: @due2day_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /due2day_lists/1
  # PATCH/PUT /due2day_lists/1.json
  def update
    respond_to do |format|
      if @due2day_list.update(due2day_list_params)
        format.html { redirect_to @due2day_list, notice: 'Due2day list was successfully updated.' }
        format.json { render :show, status: :ok, location: @due2day_list }
      else
        format.html { render :edit }
        format.json { render json: @due2day_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /due2day_lists/1
  # DELETE /due2day_lists/1.json
  def destroy
    @due2day_list.destroy
    respond_to do |format|
      format.html { redirect_to due2day_lists_url, notice: 'Due2day list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_due2day_list
      @due2day_list = Due2dayList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def due2day_list_params
      params.require(:due2day_list).permit(:title, :description)
    end
end
