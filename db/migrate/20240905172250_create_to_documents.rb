class CreateToDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :to_documents do |t|
      t.string :name
      t.string :title
      t.text :description
      t.references :internship, null: false, foreign_key: true
      add_column :to_documents, :archived, :boolean, default: false
      t.timestamps
    end
  end
end
