class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :due_date, :project_id

  belongs_to :project
end
