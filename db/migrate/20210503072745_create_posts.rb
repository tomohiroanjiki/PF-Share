class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :genre
      t.string :title
      t.string :image_id
      t.text :contents
      t.integer :customer_id

      t.timestamps
    end
  end
end
