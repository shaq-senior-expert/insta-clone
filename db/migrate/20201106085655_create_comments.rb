class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.references :post
      t.references :user
      t.timestamps
    end
  end
end
