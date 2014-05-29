class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.visible.asc :priority
  end

  def show
    redirect_to category_questions_url(Category.find params[:id])
  end
end
