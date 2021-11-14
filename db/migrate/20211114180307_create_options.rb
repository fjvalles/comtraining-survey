class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.integer :order, default: 1
      t.references :question, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
