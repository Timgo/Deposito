# == Schema Information
# Schema version: 20100712175945
#
# Table name: pedido_items
#
#  id          :integer         not null, primary key
#  id_produto  :integer         not null
#  id_pedido   :integer         not null
#  quantidade  :integer         not null
#  preco_total :decimal(, )     not null
#  created_at  :datetime
#  updated_at  :datetime
#

class PedidoItem < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto
  
  def self.da_lista_item(lista_item)
    li = self.new
    li.produto = lista_item.produto
    li.quantidade = lista_item.quantidade
    li.preco_total = lista_item.preco_item
    #li.id_produto = lista_item.produto.id
    #li.id_pedido = Pedido.id
    li
  end
    
end
