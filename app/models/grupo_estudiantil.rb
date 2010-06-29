class GrupoEstudiantil < ActiveRecord::Base
  belongs_to :universidad
  has_many :actividades
  has_many :noticias
  has_many :representantes  
  has_many :users, :through => :representantes
  has_attached_file :logo, :styles => { :small => "150x150>", :mini => "40x40>" },
  :url => "/uploads/grupos_estudiantiles/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/uploads/grupos_estudiantiles/:attachment/:id/:style/:basename.:extension"  
end