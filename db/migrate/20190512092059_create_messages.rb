class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :mobile_number
      t.text :enquiry
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
