# frozen_string_literal: true

# application_controller
class ApplicationController < ActionController::Base
  helper_method :current_cart

  def after_sign_in_path_for(_admin)
    admins_items_path
  end

  private

  # セッションの作成
  def current_cart
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_cart = Cart.find_by(id: session[:cart_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart ||= Cart.create
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:cart_id] = current_cart.id
    # Cart情報を返却
    current_cart
  end
end
