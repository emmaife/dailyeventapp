class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'category was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end
  
  def index
    @categories = Category.all
  end

  def update
    @category.update(category_params)
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'category was successfully updated.' }
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

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :categories)
  end

end