class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :total_likes, :integer
    add_column :posts, :total_comments, :integer
  end
end
