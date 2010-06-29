class CreateNoticias < ActiveRecord::Migration
  def self.up
    create_table :noticias do |t|
      t.strin :titulo
      t.text :descripcion
      t.integer :grupo_estudiantil_id

      t.timestamps
    end
  end

  def self.down
    drop_table :noticias
  end
end
