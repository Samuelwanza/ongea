class RemoveColumnsFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :references, :string
    remove_column :posts, :users, :string
  end
end
