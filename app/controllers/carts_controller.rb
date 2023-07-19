# frozen_string_literal: true

# cart_controller
class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item]
  before_action :set_cart, only: %i[confirm_order place_order add_item]

  def show
    @cart_items = current_cart.cart_items
  end

  def confirm_order
    @cart = current_cart.cart_items
    @order = Order.new
  end

  def create
    @items = current_cart.items.all
    @cart_items = current_cart.cart_items
    @order = current_cart.orders.new(order_params)
    if @items.all? { |item| item.aasm_state == 'unreserved' }
      if @order.save!
        # 注文が確定したので、itemのreservedカラムを更新する
        @items.each do |item|
          OrderItem.create(item_id: item.id, order_id: @order.id, price: item.price)
          item.reserve
          item.save
        end
        @cart_items.destroy_all
        AdminMailer.order_email(@order).deliver
        redirect_to root_path, notice: 'You reserved!'
      else
        render :confirm_order
      end
    else
      redirect_to cart_path(current_cart), notice: 'Some items are already reserved.'
    end
  end

  def add_item
    @cart_item = @cart.cart_items.build(item_id: params[:item_id]) if @cart_item.blank?
    @cart_item.quantity = params[:quantity].to_i # quantityの量をパラメーターとして受け取ったら、それをcart_itemのquantityとして、認識する。
    if @cart_item.save
      redirect_to current_cart
    else
      redirect_to controller: 'items', action: 'show'
    end
  end

  def edit; end

  def update; end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:success] = 'Delete the items'
    redirect_to cart_path
  end

  private

  def set_line_item
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end

  def set_cart
    @cart = current_cart
  end

  def order_params
    params.require(:order).permit(:name, :phone_number, :address, :cart_id)
  end
end
