class Api::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment

  def create
    if @comment.like_for(current_user) == nil
      @like = @comment.likes.new
      @like.user = current_user
      if @like.save
        render json: @like
      else
        render json: {saved: false}
      end
    else
      render json: {saved: false, previous_like: true}
    end
  end

  def destroy
    @like = @comment.likes.find params[:id]
    if @like.destroy
      render json: {destroyed: true}
    else
      render json: {destroyed: false}
    end
  end

  private

  def find_comment
    @comment = Comment.find params[:comment_id]
  end
end
