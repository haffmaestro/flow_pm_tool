class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :discussion_id, :user_id

  belongs_to :discussion
  belongs_to :user
end
