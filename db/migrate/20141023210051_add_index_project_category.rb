class AddIndexProjectCategory < ActiveRecord::Migration
  def change
    add_index :projects, :category_id
  end
end
