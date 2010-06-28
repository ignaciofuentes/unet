class User < ActiveRecord::Base
  acts_as_authentic
  #validate :rol_debe_ser_igual_o_menor_al_del_creador
  has_many :representantes  
  has_many :grupos_estudiantiles, :through => :representantes
  has_many :mensajes_recibidos, :class_name => 'Mensaje', :foreign_key => 'receptor_id'
  has_many :mensajes_enviados, :class_name => 'Mensaje', :foreign_key => 'emisor_id'
  has_many :assignments
  has_many :roles, :through =>:assignments
  attr_accessible :login, :email, :password, :password_confirmation, :openid_identifier, :role_ids, :grupo_estudiantil_ids

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
	
	def admin?
	assignments.each do |a|
	if a.role.name=='admin'
	return true
	end
	end
	return false
	end

def role_symbols
  roles.map do |role|
    role.name.underscore.to_sym
  end
end

def rol_debe_ser_igual_o_menor_al_del_creador
  if(1==1)
    errors.add(:roles, "No puede ser "+self.roles.first.name)
  end
end 

end