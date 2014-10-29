task bootstrap_all_data: [:environment] do
  if Project.count > 20
    puts "Data Strapped"
  else
    30.times do
      Project.create(
        title: Faker::App.name,
        description: Faker::Lorem.paragraph,
        due_date: Faker::Time.forward(rand(59), :morning),
        user: User.all.sample
        )
    end
  end

  Project.all.each do |project|
    rand(10).times {
      project.tasks.create(
        title: Faker::Hacker.say_something_smart,
        due_date: (Time.now + (rand(20)).days)
        )
    }
  end

  Project.all.each do |project|
    rand(10).times {
      project.discussions.create(
        title: Faker::Commerce.department,
        description: Faker::Company.catch_phrase
        )
    }
  end

  Discussion.all.each do |discussion|
    rand(10).times {
      discussion.comments.create(
        body: Faker::Hacker.say_something_smart,
        user: User.all.sample
        )
    }
  end
end