class AddResourcesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :resource, :string
  end
end
