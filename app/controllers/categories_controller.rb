class CategoriesController < ApplicationController
  def index
    @items = Item.where(category_id: params[:category_id])
    @categories = Category.all
  end

  def edit
  end

  def show
    @category_item = Category.find(params[:id]).items
  end
end
