json.project do
  json.id @project.id
  json.title @project.title
  json.tasks @project.tasks do |task|
    json.id task.id
    json.title task.title
    json.due_date task.due_date
  end
end