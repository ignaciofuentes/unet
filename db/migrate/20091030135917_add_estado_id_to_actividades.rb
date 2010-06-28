class AddEstadoIdToActividades < ActiveRecord::Migration
  def self.up
    add_column :actividades, :estado_id, :int
  end

  def self.down
    remove_column :actividades, :estado_id
  end
end
