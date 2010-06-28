class CreateGruposEstudiantiles < ActiveRecord::Migration
  def self.up
    create_table :grupos_estudiantiles do |t|
      t.string :nombre
      t.integer :ano
      t.integer :universidad_id

      t.timestamps
    end
  end

  def self.down
    drop_table :grupos_estudiantiles
  end
end