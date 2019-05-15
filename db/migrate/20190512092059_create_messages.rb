class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :encrypted_email
      t.string :encrypted_email_iv
      t.string :encrypted_first_name
      t.string :encrypted_first_name_iv
      t.string :encrypted_last_name
      t.string :encrypted_last_name_iv
      t.string :encrypted_mobile_number
      t.string :encrypted_mobile_number_iv
      t.text :enquiry
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
