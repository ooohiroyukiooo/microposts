class CreateFavoriterelationships < ActiveRecord::Migration
  def change
    create_table :favoriterelationships do |t|
      t.references :micropost, index: true #foreign_key: true
      t.references :fuser, index: true #foreign_key: true

      t.timestamps null: false
      
      t.index [:micropost_id, :fuser_id], unique: true
    end
  end
end
