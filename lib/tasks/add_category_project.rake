task add_category_project: [:environment] do

  all_categories = Category.all
  Project.all.each do |project|
    project.category_id = all_categories[rand(6)].id
    project.save
  end

end