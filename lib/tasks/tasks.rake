task task_data: [:environment] do

  Project.all.each do |project|

    rand(10).times {
      project.tasks.create(
        title: Faker::Hacker.say_something_smart,
        due_date: (Time.now + (rand(20)).days)
      )
    }
  end
end