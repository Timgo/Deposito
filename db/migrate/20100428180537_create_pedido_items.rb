class CreatePedidoItems < ActiveRecord::Migration
  def self.up
    create_table :pedido_items do |t|
      t.integer :id_produto, :null => false, :options => 
      "CONSTRAINT fk_pedido_item_produtos REFERENCES produtos(id)"
      t.integer :id_pedido, :null => false, :options => 
      "CONSTRAINT fk_pedido_item_pedidos REFERENCES pedidos(id)" 
      t.integer :quantidade, :null => false
      t.decimal :preço_total, :null => false, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :pedido_items
  end
end
