class AddDescripcionToUniversidades < ActiveRecord::Migration
  def self.up
    add_column :universidades, :descripcion, :text
  end

  def self.down
    remove_column :universidades, :descripcion
  end
end
