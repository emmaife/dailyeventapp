# class UsersController < ApplicationController
  
#   # def create
#   #   # selected_user_ids = params[:user_neighborhood].map{|k,v| k if v == "1"}.compact
#   #   # selected_neighborhood_ids.each do |id|
#   #   #   UserNeighborhood.create(user_id: current_user.id, neighborhood_id: id.to_i)  
#   #   # end
#   #   redirect_to root_path
#   # end

#   def update
#     # user_neighborhoods = User.find(params[:neighborhood])
  
#     # current_user.update(params[:user])
#     # self.update_attributes(params[:user])
#     # user_neighborhoods = params[:user][:neighborhood].each do |hood|
#     #   hood


#   end

#   # def user_params
#   #   params.require(:user).permit(:user_id, :neighborhood_id)
#   # end

# end

class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def index
    @users = User.all
  end

  def update
    @user.update(user_params)
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to preferences_path, notice: 'user was successfully updated.' }
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

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :neighborhood_ids => [])
  end

end
