class CreateProficiencies < ActiveRecord::Migration[5.0]
  def change
    create_table :proficiencies do |t|
      t.references :survey, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
