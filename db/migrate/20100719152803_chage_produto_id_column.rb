class ChageProdutoIdColumn < ActiveRecord::Migration
  def self.up
    rename_column :pedido_items, :id_produto, :produto_id
    rename_column :pedido_items, :id_pedido, :pedido_id
  end

  def self.down
    rename_column :pedido_items, :produto_id, :id_produto
    rename_column :pedido_items, :pedido_id, :id_pedido
  end
end
