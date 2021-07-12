class RegisterController < ApplicationController
  def index
    render "index"
  end

  def register
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], role: params[:role])
    if @user.save
      redirect_to home_path
    end
  end
end
