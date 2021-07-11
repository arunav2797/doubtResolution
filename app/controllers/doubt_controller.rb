class DoubtController < ApplicationController
  def doubtForm; end
  def raise_doubt
    @doubt = Doubt.new(title: params[:title], description: params[:description], user_id: session[:user_id], status: "Submitted")
    respond_to do |format|
      if @doubt.save
        @ta_id = User.where(role: "TA").pluck(:id).sample
        @doubt_association = TaDoubt.new(user_id: @ta_id, doubt_id: @doubt.id)
        if @doubt_association.save
          format.html { redirect_to home_path, notice: 'Doubt raised successdfully' }
        end
      end
    end
  end
end
