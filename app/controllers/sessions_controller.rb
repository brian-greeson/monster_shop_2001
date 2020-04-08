class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email_address: params[:email_address])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.user_detail.name}"
      dynamic_redirect
    else
      flash[:error] = "Invalid Credentials"
      render :new
    end
  end

  private
  def dynamic_redirect
    redirect_to "/profile" if current_user.role == "default"
    redirect_to "/merchant/dashboard" if current_user.role == "merchant"
    redirect_to "/admin/dashboard" if current_user.role == "admin"
  end
end
