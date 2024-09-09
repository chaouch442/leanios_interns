class AddStatusToStagiaires < ActiveRecord::Migration[6.1]
  def change
    add_column :stagiaires, :status, :string
  end
end
