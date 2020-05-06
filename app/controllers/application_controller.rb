class ApplicationController < ActionController::Base
  # devise_controller:ログイン機能を使った時に実際に動作するコントローラー
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン機能を利用して実際にニックネームを登録しようとした時に、どういうパラメーターが許可できるかを記述
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
