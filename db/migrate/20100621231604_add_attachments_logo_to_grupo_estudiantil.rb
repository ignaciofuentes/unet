class AddAttachmentsLogoToGrupoEstudiantil < ActiveRecord::Migration
  def self.up
    add_column :grupos_estudiantiles, :logo_file_name, :string
    add_column :grupos_estudiantiles, :logo_content_type, :string
    add_column :grupos_estudiantiles, :logo_file_size, :integer
    add_column :grupos_estudiantiles, :logo_updated_at, :datetime
  end

  def self.down
    remove_column :grupos_estudiantiles, :logo_file_name
    remove_column :grupos_estudiantiles, :logo_content_type
    remove_column :grupos_estudiantiles, :logo_file_size
    remove_column :grupos_estudiantiles, :logo_updated_at
  end
end
