class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
t.integer :author_id
t.integer :post_id
t.string :text
add_index :comments, [:author_id, :post_id]

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :author_id
    add_foreign_key :comments, :posts, column: :post_id
  end
end
