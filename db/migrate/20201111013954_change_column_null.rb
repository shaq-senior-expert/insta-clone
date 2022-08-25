class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :user_id, :true
    change_column_null :posts, :created_at, :true
    change_column_null :posts, :updated_at, :true
    change_column_null :comments, :created_at, :true
    change_column_null :comments, :updated_at, :true
    change_column_null :likes, :created_at, :true
    change_column_null :likes, :updated_at, :true
    change_column_null :followers, :created_at, :true
    change_column_null :followers, :updated_at, :true
    change_column_null :users, :email, :true
    change_column_null :users, :created_at, :true
    change_column_null :users, :updated_at, :true
    change_column_null :users, :sign_in_count, :true
    change_column_null :users, :encrypted_password, :true
  end
end
