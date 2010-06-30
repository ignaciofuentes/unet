class Mensaje < ActiveRecord::Base
  belongs_to :emisor, :class_name => 'User'
  belongs_to :receptor, :class_name => 'User'
  validates_associated :receptor

  
  def receptor_login
	self.receptor.login
  end
  
  def receptor_login=(name)
	self.receptor=User.find_by_login(name) || User.new
end


end
