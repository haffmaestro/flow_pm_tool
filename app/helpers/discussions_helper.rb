module DiscussionsHelper
  def comment_user_display(comment)
    if comment.user
      comment.user.user_name
    else
      "Adolph Gitler"
    end
  end

  def user_helper(comment)
    if comment.user
      comment.user_name
    else
      'Darth Vader'
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
    end.to_json
  end

end
