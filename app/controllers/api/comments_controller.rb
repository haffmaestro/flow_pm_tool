class Api::CommentsController < ActionController::Base

  before_action :find_comments, only: [:index]
  def index
    render json: comments_to_json(@comments)
  end

  private
  def find_comments
    @comments = Discussion.find(params[:discussion_id]).comments
  end

  def user_helper(comment)
    if comment.user
      comment.user.user_name
    else
      'Adolph Gitler'
    end
  end

  def comments_to_json(comments)
    comments.collect do |comment|
      {
        id: comment.id,
        body: comment.body,
        created_at: comment.created_at,
        user: user_helper(comment)
      }
    end
  end
end