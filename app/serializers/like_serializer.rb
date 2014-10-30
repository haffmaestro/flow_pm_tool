class LikeSerializer < ActiveModel::Serializer
  attributes :id, :comment_id, :user_id
end
