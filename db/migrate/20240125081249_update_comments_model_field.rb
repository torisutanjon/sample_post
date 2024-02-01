class UpdateCommentsModelField < ActiveRecord::Migration[7.1]
  def change
    change_table :comments do |t|
      t.rename :posts_id, :post_id
    end
  end
end
