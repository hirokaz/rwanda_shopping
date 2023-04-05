class ItemsController < ApplicationController
  def index
    @tops_item = Item.where(category_id: 1).last(3)
    @bottoms_item = Item.where(category_id: 2).last(3)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  #def category
  # @items = Item.where(size: "S") #これでカテゴリーわけする？
  # end
end
