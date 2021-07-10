class HomeController < ApplicationController
  before_action :require_user_logged_in!, :index
  def index
    if params[:role] == 'Student'
      render "student"
    end
    if params[:role] == 'TA'
      render "TA"
    end
    if params[:role] == 'Teacher'
      render "Teacher"
    end
  end
end
