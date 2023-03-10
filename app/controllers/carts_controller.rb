class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item]
  before_action :set_cart

  def show
    @cart = @cart.cart_items #今日はここまで
  end

  def add_item
    @cart_item = @cart.cart_items.build(item_id: params[:item_id]) if @cart_item.blank?
    @cart_item.quantity = params[:quantity].to_i #quantityの量をパラメーターとして受け取ったら、それをcart_itemのquantityとして、認識する。
    if @cart_item.save
      redirect_to current_cart
    else
      redirect_to controller: "items", action: "show"
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id]).destroy
    flash[:success] = "Delete the items"
    redirect_to cart_path
  end

  private

  def set_line_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

  def set_cart
    @cart = current_cart
  end
end
