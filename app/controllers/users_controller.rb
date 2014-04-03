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
    # binding.pry
    @user.update(user_params)
    respond_to do |format|
      if @user.update(user_params)
        EventMailer.event_email(@user).deliver
        format.html { redirect_to root_path, notice: 'user was successfully updated.' }
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
    params.require(:user).permit(:email, :neighborhood_ids => [], :category_ids => [])
  end

end
