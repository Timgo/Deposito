class CreateTipoDePagamentos < ActiveRecord::Migration
  def self.up
    create_table :tipo_de_pagamentos do |t|
      t.text :exibido
      t.text :registro
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_de_pagamentos
  end
end
