class UsersController < ApplicationController
  
  # def create
  #   # selected_neighborhood_ids = params[:user_neighborhood].map{|k,v| k if v == "1"}.compact
  #   # selected_neighborhood_ids.each do |id|
  #   #   UserNeighborhood.create(user_id: current_user.id, neighborhood_id: id.to_i)  
  #   # end
  #   redirect_to root_path
  # end

  def update
    binding.pry
    # user_neighborhoods = User.find(params[:neighborhood])

    # current_user.update(params[:user])
    # self.update_attributes(params[:user])
    # user_neighborhoods = params[:user][:neighborhood].each do |hood|
    #   hood

    redirect_to preferences_path
  end

  # def user_params
  #   params.require(:user).permit(:user_id, :neighborhood_id)
  # end

end