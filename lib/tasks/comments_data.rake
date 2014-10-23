task comments_data: [:environment] do
  Project.all.each do |project|
    project.discussions.each do |discussion|
      rand(10).times {
        discussion.comments.create(
          body: Faker::Lorem.sentences.join(" ")
        )
      }
    end
  end

end