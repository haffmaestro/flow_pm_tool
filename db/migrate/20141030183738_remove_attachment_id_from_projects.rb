class RemoveAttachmentIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :attachment_id, :string
    add_reference :attachments, :project, index: true
  end
end
