class ItemsController < ApplicationController
  def index
    @items = Item.last(7)
  end

  def show
    @item = Item.find(params[:id])
  end

  #def category
  # @items = Item.where(size: "S") #これでカテゴリーわけする？
  # end
end
