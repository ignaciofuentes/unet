class AddGrupoEstudiantilIdToActividad < ActiveRecord::Migration
  def self.up
    add_column :actividades, :grupo_estudiantil_id, :integer
  end

  def self.down
    remove_column :actividades, :grupo_estudiantil_id
  end
end
