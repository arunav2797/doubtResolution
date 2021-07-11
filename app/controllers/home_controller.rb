class HomeController < ApplicationController
  before_action :require_user_logged_in!, :index
  def index
    if session[:role] == 'Student'
      @doubts = Doubt.all
      render "student"
    end
    if session[:role] == 'TA'
      render "TA"
    end
    if session[:role] == 'Teacher'
      render "Teacher"
    end
  end
end
