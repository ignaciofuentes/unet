class CreateActividades < ActiveRecord::Migration
  def self.up
    create_table :actividades do |t|
      t.string :titulo
      t.text :descripcion
      t.date :fecha
      t.string :direccion

      t.timestamps
    end
  end

  def self.down
    drop_table :actividades
  end
end
