class NeighborhoodsController < ApplicationController

  before_action :set_neighborhood, only: [:show, :edit, :update, :destroy]

  def new
    @neighborhood = Neighborhood.new
  end

  def create
    @neighborhood = Neighborhood.create(neighborhood_params)
    respond_to do |format|
      if @neighborhood.save
        format.html { redirect_to @neighborhood, notice: 'neighborhood was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def index
    @neighborhoods = Neighborhood.all
  end

  def update
    @neighborhood.update(neighborhood_params)
    respond_to do |format|
      if @neighborhood.update(neighborhood_params)
        format.html { redirect_to @neighborhood, notice: 'neighborhood was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def edit
  end

  def show
  end

  

private

  def set_neighborhood
    @neighborhood = Neighborhood.find(params[:id])
  end

  def neighborhood_params
    params.require(:neighborhood).permit(:name)
  end

end
