json.discussion do
  json.id @discussion.id
  json.title @discussion.title
  json.today Date.today
  json.comments @discussion.comments do |comment|
    json.body comment.body
    json.id comment.id
    json.user (comment.user_id ? comment.user.user_name : 'Adolph Gitler')
    json.created_at comment.created_at
  end
end