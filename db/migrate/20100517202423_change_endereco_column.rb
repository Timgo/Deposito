class ChangeEnderecoColumn < ActiveRecord::Migration
  def self.up
    rename_column :pedidos, :endereço, :endereco
  end

  def self.down
    rename_column :pedidos, :endereco, :endereço
  end
end
