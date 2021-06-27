class ChangeDatatypeGenreOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :genre, :string
  end
end
