class ItemsController < ApplicationController
  def index
    @tops = Item.where(category_id: 1).last(7)
    @category_tops = Category.find(1)

    @category = Category.order(:id) #1の次に2を並べる

    if @category == Category.find(1) #
      @items = Item.where(category_id: 1).last(7)
    else @category == Category.find(2) #
      @items = Item.where(category_id: 1).last(7)     end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  #def category
  # @items = Item.where(size: "S") #これでカテゴリーわけする？
  # end
end
