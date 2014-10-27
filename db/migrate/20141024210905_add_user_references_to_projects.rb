class AddUserReferencesToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true
    add_reference :comments, :user, index: true
  end
end
