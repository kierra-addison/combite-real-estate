class AddGoogleMapEmbedToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :google_map_embed, :string
  end
end
