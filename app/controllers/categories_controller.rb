class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit
  end

  def show
    if params[:price_asc]
      @category_item = Category.find(params[:id]).items.order(price: :asc)
    elsif params[:price_desc]
      @category_item = Category.find(params[:id]).items.order(price: :desc)
    else
      @category_item = Category.find(params[:id]).items
    end
  end
end
