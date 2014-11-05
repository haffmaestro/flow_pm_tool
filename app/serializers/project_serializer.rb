class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :user_id, :category_id, :attachments

  has_many :discussions, embed: :objects
  has_many :tasks, embed: :objects
end