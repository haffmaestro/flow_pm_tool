class Api::CommentsController < ActionController::Base
  before_action :find_comments, only: [:index]
  before_action :find_comment, only: [:destroy, :unlike]

  def index
    # render json: @discussion
  end

  def create
    @comment = Comment.new comment_params
    @discussion = Discussion.find params[:discussion_id].to_i
    @comment.discussion = @discussion
    @comment.user = current_user
    if @comment.save
      render json: {saved: true}
    else
      render json: {saved: false}
    end
  end

  def destroy
    if @comment.destroy
      render json: {destroyed: true}
    else
      render json: {destroyed: false}
    end
  end

  def unlike
    if @comment.like_for(current_user).destroy
      render json: @comment
    else
      render json: {destroyed: false}
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_comments
    @discussion = Discussion.find(params[:discussion_id])
    @comments = Discussion.find(params[:discussion_id]).comments
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
