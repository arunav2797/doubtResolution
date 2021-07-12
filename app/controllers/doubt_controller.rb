class DoubtController < ApplicationController
  before_action :require_user_logged_in!
  def doubtForm; end
  def raise_doubt
    if session[:role] == "Student"
      @doubt = Doubt.new(title: params[:title], description: params[:description], user_id: session[:user_id], status: "Submitted")
      respond_to do |format|
        if @doubt.save
          @doubt_association = TaDoubt.new(doubt_id: @doubt.id, status: "Submitted")
          if @doubt_association.save
            format.html { redirect_to home_path, notice: "Doubt raised successdfully" }
          end
        end
      end
    end
  end

  def accept_doubt
    if session[:role] == "TA"
      @doubt = Doubt.find(params[:doubt_id])
      @doubt.update(status: "Accepted", accepted_at: Time.now)
      if TaDoubt.where(doubt_id: params[:doubt_id], status: "Escalated").count > 0
        TaDoubt.where(doubt_id: params[:doubt_id], status: "Submitted").update(user_id: session[:user_id], status: "Accepted")
      else
        TaDoubt.where(doubt_id: params[:doubt_id], status: "Submitted").update(user_id: session[:user_id], status: "Accepted")
      end
      redirect_to doubt_detail_path(doubt_id: params[:doubt_id])
    end
  end

  def doubt_detail
    if session[:role] == "TA"
      @doubt = Doubt.find(params[:doubt_id])
      render "doubtDetail"
    end
  end

  def answer_doubt
    if session[:role] == "TA"
      @doubt_assoc = TaDoubt.where(user_id: session[:user_id], doubt_id: params[:doubt_id], status: "Accepted")
      @doubt_assoc.update(status: "Resolved")
      @doubt = Doubt.where(id: params[:doubt_id])
      @doubt.update(solution: params[:solution], status: "Resolved", resolved_at: Time.now)
      redirect_to home_path
    end
  end

  def escalate_doubt
    if session[:role] == "TA"
      @doubt_assoc = TaDoubt.where(doubt_id: params[:doubt_id])
      @new_row = TaDoubt.new(doubt_id: params[:doubt_id], status: "Submitted")
      TaDoubt.where(user_id:  session[:user_id], doubt_id: params[:doubt_id]).update(status: "Escalated")
      Doubt.where(id: params[:doubt_id]).update(status: "Submitted", accepted_at: Time.now)
      if @new_row.save
      redirect_to home_path
      end
    end
  end
end
