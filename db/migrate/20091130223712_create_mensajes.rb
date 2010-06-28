class CreateMensajes < ActiveRecord::Migration
  def self.up
    create_table :mensajes do |t|
      t.string :titulo
      t.text :contenido
      t.integer :emisor_id
      t.integer :receptor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :mensajes
  end
end
