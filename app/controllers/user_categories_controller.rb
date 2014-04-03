class UserCategoriesController < ApplicationController

  def create
    selected_category_ids = params[:user_category].map{|k,v| k if v == "1"}.compact
    selected_category_ids.each do |id|
      UserNeighborhood.create(user_id: current_user.id, category_id: id.to_i)  
    end
    redirect_to root_path
  end

  def update
    user_categories = UserCategory.find(params[:user_category])
    user_categories.update_attributes(params[:user_category])
  end


end