class AddCreatorIdToInterestGroups < ActiveRecord::Migration
  def up
    add_column :interest_groups, :creator_id, :integer, null: false
  end

  def down
    remove_column :interest_groups, :creator_id
  end

end
