class AddNameToToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :to_documents, :name, :string
  end
end
