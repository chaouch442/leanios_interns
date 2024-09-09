class AddTitleToInternships < ActiveRecord::Migration[6.1]
  def change
    add_column :internships, :title, :string
  end
end
