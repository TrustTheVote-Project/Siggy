class CreateSignatureSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :signature_submissions do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :suffix
      t.text :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :county
      t.string :email
      t.string :phone
      t.string :phone_type
      t.text   :signature_image

      t.string :dob_day
      t.string :dob_month
      t.string :dob_year
      
      t.string :id_number

      t.string :status
      t.timestamps
    end
    add_index :signature_submissions, :county
    add_index :signature_submissions, :status
  end
end
