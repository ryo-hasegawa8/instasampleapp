class AddIndexToComment < ActiveRecord::Migration[5.1]
  def change
    add_index :comments , [:user_id, :micropost_id, :created_at]
  end
end
