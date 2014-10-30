class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :discussion_id, :user_id

  has_many :likes

end
