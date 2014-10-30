class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|

      t.timestamps
    end
  end
  add_reference :projects, :attachment, index: true
end
