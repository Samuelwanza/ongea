class RemoveUsersFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :author_id, :string
  end
end
