class AddCreatorToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :creator_id, :integer
  end

  def self.down
    remove_column :users, :creator_id, :integer
  end
end
