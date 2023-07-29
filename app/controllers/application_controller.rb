# frozen_string_literal: true

# application_controller
class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :config_permitted_parameters, if: :devise_controller?
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
  
  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up)
    devise_parameter_sanitizer.permit(:account_update)
  end
end
