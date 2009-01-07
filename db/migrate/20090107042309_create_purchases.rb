class CreatePurchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.integer :product_id
      t.integer :amount
      t.decimal :total_price, :precision => 16, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :purchases
  end
end
