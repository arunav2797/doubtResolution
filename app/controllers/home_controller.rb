class HomeController < ApplicationController
  before_action :require_user_logged_in!, :index

  def index
    if session[:role] == "Student"
      @doubt = Doubt.new
      @doubts = Array.new
      Doubt.all.each do |d|
        @doubt = d
        @doubt.comments = Comment.where(doubt_id: d.id)
        @doubts.push(@doubt)
      end
      render "student"
    end
    if session[:role] == "TA"
      @doubts = Doubt.all
      @doubt_assoc = TaDoubt.all
      render "TA"
    end
    if session[:role] == "Teacher"
      @no_of_doubts = Doubt.count
      @no_of_resolved_doubts = Doubt.where(status: "Resolved").count
      @no_of_doubts_escalated = Doubt.where(status: "Escalated").count
      @ta = User.where(role: "TA")
      render "Teacher"
    end
  end

  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff

    "#{hours.to_s.rjust(2, "0")}:#{minutes.to_s.rjust(2, "0")}:#{seconds.to_s.rjust(2, "0")}"
  end
  
end
