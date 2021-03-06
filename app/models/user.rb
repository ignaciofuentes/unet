class User < ActiveRecord::Base
  acts_as_authentic
  #validate :rol_debe_ser_igual_o_menor_al_del_creador
  belongs_to :grupo_estudiantil
  has_attached_file :photo, :styles => { :small => "180x180>" },
  :url => "/uploads/users/:attachment/:id/:style/:basename.:extension",
  :path => ":rails_root/public/uploads/users/:attachment/:id/:style/:basename.:extension"
  validates_attachment_size :photo,  :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png','image/gif']
  
  has_many :mensajes_recibidos, :class_name => 'Mensaje', :foreign_key => 'receptor_id', :order=> "created_at DESC", :dependent => :destroy
  has_many :mensajes_enviados, :class_name => 'Mensaje', :foreign_key => 'emisor_id', :order=> "created_at DESC", :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  has_many :roles, :through =>:assignments
  
  def self.search(term)
  if term
    find(:all, :conditions => ['login LIKE ?', "%#{term}%"])
  else
    find(:all)
  end
end

  def active?
    active
  end
  # added to user.rb
  def activate!
    self.active = true
    save
  end
  def deliver_activation_instructions!
      reset_perishable_token!
      Notifier.deliver_activation_instructions(self)
    end

    def deliver_activation_confirmation!
      reset_perishable_token!
      Notifier.deliver_activation_confirmation(self)
    end
	

def role_symbols
  roles.map do |role|
    role.name.underscore.to_sym
  end
end


	def grupo_estudiantil_nombre
		grupo_estudiantil.nombre if grupo_estudiantil
	end
	
	def grupo_estudiantil_nombre=(nombre)
		self.grupo_estudiantil=GrupoEstudiantil.find_by_nombre(nombre) unless nombre.blank?
	end

end