class LoginController < ApplicationController
  def new; end
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:role] = user.role
      session[:email] = user.email
      redirect_to home_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
end
