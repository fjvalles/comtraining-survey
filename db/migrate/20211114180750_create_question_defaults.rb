class CreateQuestionDefaults < ActiveRecord::Migration[5.0]
  def change
    create_table :question_defaults do |t|
      t.integer :q_type
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
