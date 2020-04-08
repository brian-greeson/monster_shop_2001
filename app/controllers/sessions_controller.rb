class SessionsController < ApplicationController
  def new
    dynamic_redirect unless current_user.nil?
  end

  def create
    user = User.find_by(email_address: params[:email_address])
    if user.nil?
      flash[:error] = "Invalid Credentials"
      render :new
    elsif user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in as #{user.user_detail.name}"
      dynamic_redirect
    else
      flash[:error] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    current_user = nil
    session[:cart] = {}
    cart.contents = {} if cart.contents != {}
    flash[:success] = "Logout Succesful"
    redirect_to root_path
  end

  private
  def dynamic_redirect
    redirect_to "/profile" if current_user.role == "default"
    redirect_to "/merchant/dashboard" if current_user.role == "merchant"
    redirect_to "/admin/dashboard" if current_user.role == "admin"
  end
end
