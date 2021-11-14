class CreateOptionsQuestionDefaults < ActiveRecord::Migration[5.0]
  def change
    create_table :options_question_defaults, id: false do |t|
      t.references :option, index: true
      t.references :question_default, index: true
    end
    add_index :question_defaults, [:q_type, :survey_id], unique: true
  end
end
