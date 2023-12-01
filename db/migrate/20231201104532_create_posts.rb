class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter
      t.integer :likes_counter
      t.string :author_id
      t.string :references
      t.string :users

      t.timestamps
    end
  end
end
