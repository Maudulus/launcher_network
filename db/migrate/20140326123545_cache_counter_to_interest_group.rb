class CacheCounterToInterestGroup < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer
  end
end
