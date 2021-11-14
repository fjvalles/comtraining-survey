class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.boolean :self_evaluation
      t.date :birthdate
      t.integer :e_type, default: 0
      t.references :survey, foreign_key: true
      t.references :response, foreign_key: true
      t.references :evaluator, index: true
      t.string :first_name
      t.string :last_name
      t.string :personal_email
      t.string :work_email
      t.string :mobile_phone
      t.string :home_phone
      t.string :work_phone
      t.string :address
      t.string :identity_number
      t.string :region
      t.string :province
      t.string :commune
      t.string :country
      t.string :job_title
      t.string :seniority
      t.string :work_area

      t.timestamps
    end
  end
end
