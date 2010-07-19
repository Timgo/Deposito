# == Schema Information
# Schema version: 20100712175945
#
# Table name: pedidos
#
#  id                :integer         not null, primary key
#  nome              :string(255)
#  endereco          :text
#  email             :string(255)
#  tipo_de_pagamento :string(10)
#  created_at        :datetime
#  updated_at        :datetime
#

class Pedido < ActiveRecord::Base
  
 # TIPOS_DE_PAGAMENTO = [
      #Exibidos             salvos no DB
  #    ["Depósito Bancário", "banco" ],
   #   ["Boleto Bancário",   "boleto" ],
    #  ["PagSeguro",         "pagseguro" ],
    #  ]

     validates_presence_of :nome, :endereco, :email, :tipo_de_pagamento
     validates_inclusion_of :tipo_de_pagamento, :in => TipoDePagamento.find(:all).map {|tipo| tipo.registro}
     
   has_many :pedido_items
   # :tipo_de_pagamento
   
  def adicionar_pedido_items_da_lista(lista)
    lista.items.each do |item|
    li = PedidoItem.da_lista_item(item)
    pedido_items << li
    end
  end
    
end

