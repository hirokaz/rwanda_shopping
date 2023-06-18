class CartsController < ApplicationController
  before_action :set_line_item, only: [:add_item]
  before_action :set_cart, only: [:confirm_order, :place_order, :add_item]

  def show
    @cart_items = current_cart.cart_items
  end

  def confirm_order
    @cart = current_cart.cart_items
    @order = Order.new
  end

  def place_order
    @cart = current_cart
    @cart_items = @cart.cart_items
    @order = Order.new(order_params)
    @order.cart = @cart
  
    if @cart_items.all? { |cart_item| cart_item.item.status == "unreserved"  }
      if @order.save!
        # 注文が確定したので、itemのreservedカラムを更新する
        @cart_items.each do |cart_item|
          cart_item.item.update(status:1)
        end
        #whatsappに送るものを追加する。
  
        redirect_to root_path, notice: 'You reserved!'
      else
        render :confirm_order
      end
    else
      redirect_to controller: "carts", action: "show"
    end
  end
  



  def add_item
    @cart_item = @cart.cart_items.build(item_id: params[:item_id]) if @cart_item.blank?
    @cart_item.quantity = params[:quantity].to_i#quantityの量をパラメーターとして受け取ったら、それをcart_itemのquantityとして、認識する。
    
    if @cart_item.save
      redirect_to current_cart
    else
      redirect_to controller: "items", action: "show"
    end
  end

  def edit
  end

  def update
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

  def order_params
    params.require(:order).permit(:name, :phone_number, :address)
  end

end
