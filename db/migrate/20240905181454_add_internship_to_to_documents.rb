class AddInternshipToToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_reference :to_documents, :internship, foreign_key: true
  end
end
