class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.boolean :required, default: true
      t.integer :q_type, default: 0
      t.integer :scale, default: 0
      t.integer :order, default: 1
      t.references :survey, foreign_key: true
      t.references :proficiency, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
