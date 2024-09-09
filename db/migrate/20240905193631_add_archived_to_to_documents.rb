class AddArchivedToToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :archived, :boolean
  end
end
