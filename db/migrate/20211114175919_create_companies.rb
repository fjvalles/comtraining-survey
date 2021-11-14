class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :ceo
      t.string :industry
      t.string :address
      t.string :identity_number
      t.string :region
      t.string :province
      t.string :commune
      t.string :country
      t.string :url
      t.string :contact_email
      t.string :phone

      t.timestamps
    end
  end
end
