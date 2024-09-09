class CreateStagiaires < ActiveRecord::Migration[6.1]
  def change
    create_table :stagiaires do |t|
      t.string :last_name
      t.string :first_name
      t.string :cin
      t.date :birthdate
      t.string :phone_number

      t.timestamps
    end
  end
end
