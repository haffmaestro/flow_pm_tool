task bootstrap_projects: [:environment] do
  if Project.count > 50
    puts "Data already bootstrapped"
  else
    51.times do
      Project.create(
        title: Faker::App.name,
        description: Faker::Lorem.paragraph,
        due_date: Faker::Time.forward(50, :morning))
    end
  end

end