class CommentController < ApplicationController
  before_action :require_user_logged_in!
  def add
    @comment = Comment.new(comment: params[:comment], user_id: session[:user_id], doubt_id: params[:doubt_id], email: session[:email])
    if @comment.save
      redirect_to home_path
    end
  end
end
