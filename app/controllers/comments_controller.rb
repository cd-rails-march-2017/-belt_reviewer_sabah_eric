class CommentsController < ApplicationController

  def create
    comment = Comment.new
    comment.content = params[:content]
    comment.user_id = session[:id]
    comment.event_id = params[:id]
    if comment.valid?
      comment.save
    else
      flash[:error] = comment.error.full_messages  
    end
    redirect_to '/events/'+ params[:id].to_s + '/show'
  end
end
