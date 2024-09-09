class CreateInternships < ActiveRecord::Migration[6.1]
  def change
    create_table :internships do |t|
      t.date :start_date
      t.date :end_date
      t.string :specialty
      t.text :project
      t.references :stagiaire, null: false, foreign_key: true

      t.timestamps
    end
  end
end
