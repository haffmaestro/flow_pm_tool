class Api::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment

  def create
    @like = @comment.likes.new
    @like.user = current_user
    if @like.save
      render json: {saved: true}
    else
      render json: {saved: true}
    end
  end

  def destroy
    @like = current_user.likes.find params[:id]
    if @like.destroy
      render json: {destroyed: true}
    else
      render json: {destroyed: true}
    end
  end

  private
  def find_comment
    @comment = Comment.find params[:comment_id]
  end
end
