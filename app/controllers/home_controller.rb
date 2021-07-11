class HomeController < ApplicationController
  before_action :require_user_logged_in!, :index
  def index
    if session[:role] == 'Student'
      @doubt = Doubt.new
      @doubts = Array.new
      Doubt.all.each do |d|
        @doubt = d
        @doubt.comments = Comment.where(doubt_id: d.id)
        @doubts.push(@doubt)
      end
      render "student"
    end
    if session[:role] == 'TA'
      @doubts = Doubt.all
      @doubt_assoc = TaDoubt.all
      render "TA"
    end
    if session[:role] == 'Teacher'
      render "Teacher"
    end
  end
end
