class CreatePostAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_attributes do |t|
      t.string :attribute_name
      t.string :attribute_value
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
