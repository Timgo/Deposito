class CreatePedidos < ActiveRecord::Migration
  def self.up
    create_table :pedidos do |t|
      t.string :nome
      t.text :endereço
      t.string :email
      t.string :tipo_de_pagamento, :limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :pedidos
  end
end
