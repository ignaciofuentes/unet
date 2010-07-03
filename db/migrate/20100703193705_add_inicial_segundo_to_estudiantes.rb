class AddInicialSegundoToEstudiantes < ActiveRecord::Migration
  def self.up
    add_column :estudiantes, :inicial_segundo, :string
  end

  def self.down
    remove_column :estudiantes, :inicial_segundo
  end
end
