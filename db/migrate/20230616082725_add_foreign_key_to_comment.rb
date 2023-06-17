class AddForeignKeyToComment < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
