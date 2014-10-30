class RemoveResourceProject < ActiveRecord::Migration
  def change
    remove_column :projects, :resource
  end
end
