class Actividad < ActiveRecord::Base
  belongs_to :grupo_estudiantil
  has_many :comentarios, :as =>:comentable
  
    def self.search(term)
  if term
    find(:all, :conditions => ['titulo LIKE ?', "%#{term}%"], :order => "created_at DESC")
  else
    find(:all,:order => "created_at DESC")
  end
end
  
end