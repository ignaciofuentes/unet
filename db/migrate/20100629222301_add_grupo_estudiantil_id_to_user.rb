class AddGrupoEstudiantilIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :grupo_estudiantil_id, :integer
  end

  def self.down
    remove_column :users, :grupo_estudiantil_id
  end
end
