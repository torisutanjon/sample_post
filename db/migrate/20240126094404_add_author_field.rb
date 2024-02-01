class AddAuthorField < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :author, :string
    add_column :comments, :author, :string
  end
end
