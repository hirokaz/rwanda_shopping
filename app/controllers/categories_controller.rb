# frozen_string_literal: true

# category_controller
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def edit; end

  def show
    @category_item = if params[:price_asc]
                       Category.find(params[:id]).items.order(price: :asc).page(params[:page]).per(20)
                     elsif params[:price_desc]
                       Category.find(params[:id]).items.order(price: :desc).page(params[:page]).per(20)
                     else
                       Category.find(params[:id]).items.page(params[:page]).per(20)
                     end
  end
end
