class AddNamesAndEmailToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :first_name, :last_name, :email
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :first_name, :last_name, :email
    end
  end
end
