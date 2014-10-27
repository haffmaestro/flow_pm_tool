module CommentsHelper
  def comment_user_display(comment)
    if comment.user
      comment.user.user_name
    else
      "Adolph Gitler"
    end
  end
end
