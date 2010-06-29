class AddTituloToNoticias < ActiveRecord::Migration
  def self.up
    add_column :noticias, :titulo, :string
  end

  def self.down
    remove_column :noticias, :titulo
  end
end
