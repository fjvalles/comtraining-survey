class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.boolean :default_alignment, default: true
      t.boolean :active, default: false
      t.datetime :start_date
      t.datetime :end_date
      t.integer :s_type, default: 0
      t.integer :questionnaire_scale, default: 0
      t.integer :responses_count, default: 0
      t.integer :participants_count, default: 0
      t.references :company, foreign_key: true
      t.string :title
      t.string :token, unique: true, index: true
      t.string :demographic_title
      t.string :questionaire_title
      t.string :open_questions_title
      t.text :welcome_msg
      t.text :instructions
      t.text :goodbye_msg

      t.timestamps
    end
  end
end
