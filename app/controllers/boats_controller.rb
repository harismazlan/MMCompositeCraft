class BoatsController < ApplicationController
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @boats = Boat.all.search_boat(params[:search]).page params[:page]
    else
      @boats = Boat.all
      @boats = @boats.order(year: :asc).page(params[:page])
    end
  end

  def show
    @boats = Boat.find(params[:id])
  end

  def new
    if current_user.customer?
      flash[:notice] = "Sorry. You are not allowed to perform this action."
      return redirect_to boats_path, notice: "Sorry. You do not have the permission to create a listing."
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def create
    boat = Boat.new(boat_params)
    if boat.save
      redirect_to boats_path
    else
      redirect_to new_boat_path
    end  
  end

  def update
      if @boat.update(boat_params)
        redirect_to boat_path(@boat.id)
      end
  end

  def destroy
    @boat.destroy
    respond_to do |format|
      format.html { redirect_to boats_url, notice: 'Boat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_boat
      @boat = Boat.find(params[:id])
    end

    def boat_params
      params.require(:boat).permit(:make, :model, :year, :condition, :price, :make_type, :boat_class, :length, :fuel_type, :hull_material)
    end
    
end
