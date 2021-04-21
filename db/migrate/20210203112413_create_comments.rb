class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.string :user_id, null: false
      t.string :post_id, null: false

      t.timestamps
    end
  end
end
