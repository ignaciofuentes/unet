class Universidad < ActiveRecord::Base
  belongs_to :estado
  has_many :grupos_estudiantiles, :class_name => "GrupoEstudiantil"
  has_many :estudiantes
  has_attached_file :logo, :styles => { :small => "150x150>", :mini => "40x40>" },
  :url => "/uploads/universidades/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/uploads/universidades/:attachment/:id/:style/:basename.:extension"
  
  validates_presence_of :nombre
  validates_uniqueness_of :nombre
  validates_attachment_presence :logo
  validates_attachment_size :logo,  :less_than => 5.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png','image/gif']
  
  
  def self.search(search)
  if search
    find(:all, :conditions => ['nombre LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
end