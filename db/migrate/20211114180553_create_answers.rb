class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :response, foreign_key: true
      t.references :question, foreign_key: true
      t.text :a_text

      t.timestamps
    end
  end
end
