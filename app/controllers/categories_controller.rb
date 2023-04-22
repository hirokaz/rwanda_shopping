class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit
  end

  def show
    if params[:price_asc]
      @category_item = Category.find(params[:id]).items.order(price: :asc).page(params[:page]).per(5)
    elsif params[:price_desc]
      @category_item = Category.find(params[:id]).items.order(price: :desc).page(params[:page]).per(5)
    else
      @category_item = Category.find(params[:id]).items.page(params[:page]).per(5)
    end
  end

  private
end
