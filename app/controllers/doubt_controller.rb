class DoubtController < ApplicationController
  def doubtForm; end
  def raise_doubt
    @doubt = Doubt.new(title: params[:title], description: params[:description], user_id: session[:user_id], status: "Submitted")
    respond_to do |format|
      if @doubt.save
        @doubt_association = TaDoubt.new(doubt_id: @doubt.id)
        if @doubt_association.save
          format.html { redirect_to home_path, notice: 'Doubt raised successdfully' }
        end
      end
    end
  end

  def accept_doubt
    @doubt = Doubt.where(id: params[:doubt_id])
    @doubt.update(status: "Accepted")
    @doubt_assoc = TaDoubt.where(doubt_id: params[:doubt_id])
    @doubt_assoc.update(user_id: session[:user_id])
    redirect_to doubt_detail_path(doubt_id: params[:doubt_id])
  end

  def doubt_detail
      @doubt = Doubt.find(params[:doubt_id])
      render "doubtDetail"
  end

  def answer_doubt
    @doubt = Doubt.where(id: params[:doubt_id])
    @doubt.update(solution: params[:solution], status: "Reviewed")
    redirect_to home_path
  end

end
