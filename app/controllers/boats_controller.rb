class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  # GET /boats
  # GET /boats.json
  def index
    @boats = Boat.all
  end

  # GET /boats/1
  # GET /boats/1.json
  def show
    @boats = Boat.find(params[:id])
  end

  # GET /boats/new
  def new
    # authorization code
    if current_user.customer?
      flash[:notice] = "Sorry. You are not allowed to perform this action."
      return redirect_to boats_path, notice: "Sorry. You do not have the permission to create a listing."
    end
    # end authorization code
  end

  # GET /boats/1/edit
  def edit
    @boat = Boat.find(params[:id])
    # @boat.update(boat_params)
    # redirect_to boats_path
  end

  # POST /boats
  # POST /boats.json
  def create
    boat = Boat.new(boat_params)
    if boat.save
      redirect_to boats_path
    else
      redirect_to new_boat_path
    end
    
  end

  # PATCH/PUT /boats/1
  # PATCH/PUT /boats/1.json
  def update
      if @boat.update(boat_params)
        redirect_to boat_path(@boat.id)
      end
    
  end

  # DELETE /boats/1
  # DELETE /boats/1.json
  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boat
      @boat = Boat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boat_params
      params.require(:boat).permit(:make, :model, :year, :condition, :price, :make_type, :boat_class, :length, :fuel_type, :hull_material)
    end
end
