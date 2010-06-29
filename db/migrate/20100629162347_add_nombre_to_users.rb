class AddNombreToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :nombre, :string
    add_column :users, :apellido, :string
    add_column :users, :cedula, :string
  end

  def self.down
    remove_column :users, :cedula
    remove_column :users, :apellido
    remove_column :users, :nombre
  end
end
