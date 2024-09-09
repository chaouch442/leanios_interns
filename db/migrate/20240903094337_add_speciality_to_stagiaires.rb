class AddSpecialityToStagiaires < ActiveRecord::Migration[6.1]
  def change
    add_column :stagiaires, :speciality, :string
  end
end
