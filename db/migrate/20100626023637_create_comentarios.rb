class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.string :autor
      t.string :email
      t.text :texto
      t.integer :comentable_id
      t.string :comentable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
