# frozen_string_literal: true

# category_controller
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit; end

  def show
    @category = Category.find(params[:id])
    @items = @category.items
    
    if params[:tags].present?
      @items = @items.joins(:tags).where(tags: { id: params[:tags] })
    end
    
    if params[:price_desc]
      @items = @items.order(price: :desc)
    elsif params[:price_asc]
      @items = @items.order(price: :asc)
    end
    
    @items = @items.page(params[:page]).per(15)
  end

end
