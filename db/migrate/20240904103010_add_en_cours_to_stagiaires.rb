class AddEnCoursToStagiaires < ActiveRecord::Migration[6.0]
  def change
    add_column :stagiaires, :en_cours, :boolean, default: false
  end
end
