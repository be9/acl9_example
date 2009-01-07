class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :title
      t.decimal :price, :precision => 16, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
