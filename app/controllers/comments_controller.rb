class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @discussion = Discussion.find params[:discussion_id]
    @comment.discussion = @discussion
    if @comment.save
      redirect_to :back
    else
      redirect_to :back, notice: "Something went so wrong"
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.destroy
      redirect_to :back
    else
      redirect_to :back, notice: "YOU CANT DELETE THAT ONE!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def notice_creator(action, success=true)
    "#{@discussion.title} "+action+(success ? " successfully." : "failure.")
  end

end
