task category_data: [:environment] do
  categories = ['Sales', 'Programming', 'Productivity', 'Upkeep', 'Cats', 'IT', 'Communication']
  categories.each do |category|
    Category.create(
      name: category
      )
  end
end