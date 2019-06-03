class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]
    if user&.authenticated?(:activation, params[:id]) && !user.activated?
      activate_and_login user
      flash[:success] = t "activation_success"
      redirect_to user
    else
      flash[:danger] = t "activation_failure"
      redirect_to root_path
    end
  end

  private

  def activate_and_login user
    user.activate
    log_in user
  end
end
