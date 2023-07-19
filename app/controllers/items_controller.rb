# frozen_string_literal: true

# item_controller
class ItemsController < ApplicationController
  def index
    @tops_item = Item.where(category_id: 1).last(3)
    @bottoms_item = Item.where(category_id: 2).last(3)
  end

  def show
    @item = Item.find(params[:id])
  end
end
