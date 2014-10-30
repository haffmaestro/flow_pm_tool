class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :project_id

  has_many :comments

end
