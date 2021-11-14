class CreateAnswersOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :answers_options do |t|
      t.references :option, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
