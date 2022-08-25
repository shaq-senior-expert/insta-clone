class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      # image is changed to text
      t.text :image
      t.boolean :active
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
