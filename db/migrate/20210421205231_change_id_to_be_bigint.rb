class ChangeIdToBeBigint < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :user_id, :bigint
    change_column :comments, :post_id, :bigint
    change_column :posts, :user_id, :bigint
    change_column :poststags, :post_id, :bigint
    change_column :poststags, :tag_id, :bigint
  end
end
