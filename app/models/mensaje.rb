class Mensaje < ActiveRecord::Base
  belongs_to :emisor, :class_name => 'User'
  belongs_to :receptor, :class_name => 'User'
  validates_presence_of :receptor_id, :message=> "no existe en el sistema"

  
  def receptor_login
	self.receptor.login if receptor
  end
  
  def receptor_login=(login)
	self.receptor=User.find_by_login(login) unless login.blank?
end


end
