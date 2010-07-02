class ChangePrecoTotalColumn < ActiveRecord::Migration
  def self.up
    rename_column :pedido_items, :preço_total, :preco_total
  end

  def self.down
    rename_column :pedido_items, :preco_total, :preço_total
  end
end
