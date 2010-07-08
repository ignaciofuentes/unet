class CreateTemas < ActiveRecord::Migration
  def self.up
    create_table :temas do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :temas
  end
end
