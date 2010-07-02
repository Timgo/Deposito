class PedidoItem < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto
  
  def self.da_lista_item(lista_item)
    li = self.new
    li.produto = lista_item.produto
    li.quantidade = lista_item.quantidade
    li.preco_total = lista_item.preco_item
    li.id_produto = lista_item.produto.id
    li.id_pedido = Pedido.id
    li
  end
    
end
