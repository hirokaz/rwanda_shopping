class ApplicationController < ActionController::Base
  def after_sign_in_path_for(admin)
    admins_items_path
  end
end
