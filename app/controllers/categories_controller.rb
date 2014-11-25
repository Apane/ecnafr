class CategoriesController < ApplicationController

  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
     if @category.save
      redirect_to root_path, notice: "You've succesfully created a new category"
    else
      render :new 
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_type, :created_at, :updated_at)
  end
end
