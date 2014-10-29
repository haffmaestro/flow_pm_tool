class DiscussionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :project_id

  belongs_to :project
  has_many :comments

end
