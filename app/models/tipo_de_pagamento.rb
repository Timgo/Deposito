# == Schema Information
# Schema version: 20100712175945
#
# Table name: tipo_de_pagamentos
#
#  id         :integer         not null, primary key
#  exibido    :text
#  registro   :text
#  created_at :datetime
#  updated_at :datetime
#

class TipoDePagamento < ActiveRecord::Base
  #belongs_to :pedido
  
  def Initialize
  end
  
  #def TipoDePagamento(exibido, registro)
  #end
  
end
