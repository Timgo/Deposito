class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nome
      t.string :senha_hashed
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
