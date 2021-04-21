class CreatePostTags < ActiveRecord::Migration[6.0]
  def change
    create_table :poststags do |t|
      t.string :post_id, null: false
      t.string :tag_id, null: false

      t.timestamps
    end
  end
end
