class AddDescripcionToGruposEstudiantiles < ActiveRecord::Migration
  def self.up
    add_column :grupos_estudiantiles, :descripcion, :text
  end

  def self.down
    remove_column :grupos_estudiantiles, :descripcion
  end
end
