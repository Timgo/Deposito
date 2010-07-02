class AddPriceToProduto < ActiveRecord::Migration
  def self.up
    add_column :produtos, :price, :decimal,
    :precision => 8, :scale => 2, :default => 0
  end

  def self.down
    remove_column :produtos, :price
  end
end
