class CreateJuegos < ActiveRecord::Migration
  def self.up
    create_table :juegos do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :juegos
  end
end
