task discussion_data: [:environment] do
  Project.all.each do |project|
    rand(5).times {
      description = Faker::Company.catch_phrase if rand > 0.5
      project.discussions.create(
        title: Faker::Commerce.department,
        description: description
        )
      description = ""
    }
  end
end