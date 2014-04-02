class UserNeighborhoodsController < ApplicationController

  def create
    selected_neighborhood_ids = params[:user_neighborhood].map{|k,v| k if v == "1"}.compact
    selected_neighborhood_ids.each do |id|
      UserNeighborhood.create(user_id: current_user.id, neighborhood_id: id.to_i)  
    end
    redirect_to root_path
  end

  def update
    user_neighborhoods = UserNeighborhood.find(params[:user_neighborhood])
    user_neighborhoods.update_attributes(params[:user_neighborhood])
  end


end
