class CreateEstudiantes < ActiveRecord::Migration
  def self.up
    create_table :estudiantes do |t|
      t.string :nombre
      t.char :inicial_segundo
      t.string :apellido
      t.string :email
      t.integer :universidad_id
      t.string :telefono

      t.timestamps
    end
  end

  def self.down
    drop_table :estudiantes
  end
end
