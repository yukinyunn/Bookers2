class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]  #ログイン認証されていなければ、ログイン画面へリダイレクトする
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  # emailの値も認証に使えるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end

end
