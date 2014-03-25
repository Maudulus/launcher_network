class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :body, null: false
      t.integer :interest_group_id
      t.string :date_created

      t.timestamps
    end
  end
end
