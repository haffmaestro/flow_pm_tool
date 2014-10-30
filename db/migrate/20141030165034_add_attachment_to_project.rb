class AddAttachmentToProject < ActiveRecord::Migration
  def change
    add_column :attachments, :resource, :string
  end
end
