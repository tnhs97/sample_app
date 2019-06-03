class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate params[:session][:password]
      if @user.activated?
        login_and_redirect @user
      else
        flash[:warning] = t "account_not_activated"
        redirect_to root_path
      end
    else
      flash.now[:danger] = t "misc.login_fails"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def remmember? user
    if params[:session][:remember_me] == Settings.remember_me
      remember user
    else
      forget user
    end
  end

  def login_and_redirect user
    log_in user
    remmember? user
    redirect_back_or user
  end
end
